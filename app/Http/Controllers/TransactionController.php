<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request; 
use Illuminate\Support\Facades\Validator;

class TransactionController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function save(Request $request){

        $validator = Validator::make($request->all(), [
            'user_id'                   => 'required',
            'books'                     => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(["success"=>"0","message"=>$validator->messages()->first()]);
        }

        $number=DB::table("trans_book")->select(DB::raw("COUNT(trans_id) as total"))->first()->total;
        $number=$number+1;
        $no_tr="TR00".$number;

        try{
            DB::beginTransaction();
            DB::table("trans_book")->insert([
                "trans_id"=>$no_tr,
                "date"=>date("Y-m-d"),
                "user_id"=>$request->user_id
            ]);

            foreach($request->books as $request_e){
                DB::table("detail_trans_book")->insert([
                    "trans_id"=>$no_tr,
                    "book_id"=>$request_e["id"],
                ]);
            }
            
            DB::commit();

        }catch(Exception $e){
            DB::rollBack();
        }
        return response()->json(["success"=>"1","message"=>"Succeed"]);

    }


    public function getTransaction($id){
        $data=DB::table("trans_book")->where("user_id",$id)->paginate(10);
        foreach($data as $key=>$row){
            $total=DB::table("detail_trans_book")
            ->select(DB::raw("SUM(books.price) as  total"))
            ->join("books","id","=","detail_trans_book.book_id")
            ->where("trans_id",$row->trans_id)
            ->first();
            $total=$total->total;
            $data[$key]->date=$this->tgl_indo($row->date);
            $data[$key]->total=number_format($total);
        }

        return $data;
    }

    public function getDetailTransaction($id){
        $total=DB::table("detail_trans_book")
        ->select(DB::raw("SUM(books.price) as  total"))
        ->join("books","id","=","detail_trans_book.book_id")
        ->where("trans_id",$id)
        ->first();
        $total=$total->total;
        $data=DB::table("trans_book")->where("trans_id",$id)->first();
        $detail=DB::table("detail_trans_book")
        ->join("books","id","=","detail_trans_book.book_id")
        ->where("trans_id",$id)
        ->get();
        $data->date=$this->tgl_indo($data->date);
        $data->total=number_format($total);
        return response()->json(["data"=>$detail,"info"=>$data]);
    }


    function tgl_indo($tanggal){
        $bulan = array (
            1 =>   'Januari',
            'Februari',
            'Maret',
            'April',
            'Mei',
            'Juni',
            'Juli',
            'Agustus',
            'September',
            'Oktober',
            'November',
            'Desember'
        );
        $pecahkan = explode('-', $tanggal);
        
        // variabel pecahkan 0 = tanggal
        // variabel pecahkan 1 = bulan
        // variabel pecahkan 2 = tahun
     
        return $pecahkan[2] . ' ' . $bulan[ (int)$pecahkan[1] ] . ' ' . $pecahkan[0];
    }
    //
}
