<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request; 
use Illuminate\Support\Facades\Validator;

class BookController extends Controller
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

    public function create(Request $request){
        $validator = Validator::make($request->all(), [
            'title'                   => 'required',
            'description'             => 'required',
            'price'                   => 'required',
            "photo"                   => 'required',
            "author"                   => 'required',

        ]);

        if ($validator->fails()) {
            ///Session::flash('error', $validator->messages()->first());
            return response()->json(["success"=>"0","message"=>$validator->messages()->first()]);
       }

       $file=$request->file("photo");
       $bukti_kunjungan =sha1(time());  
       $file->move(storage_path('books'), $bukti_kunjungan);

       DB::table("books")->insert([
           "title"=>$request->title,
           "description"=>$request->description,
           "author"=>$request->author,
           "photo"=>$bukti_kunjungan,
           "price"=>$request->price,
           "publisher"=>$request->publisher
       ]);
       return  response()->json(["success"=>"1","message"=>"Succeed"]);
    }

    public function getFoto($name){
        $avatar_path = storage_path('books') . '/' . $name;
        if (file_exists($avatar_path)) {
            $file = file_get_contents($avatar_path);
            return response($file, 200)->header('Content-Type', 'image/jpeg');
         }
           $res['success'] = 0;
           $res['message'] = "Foto tidak ditemukan";
           return $res;
    }


    public function getBooks(){
      $data=DB::table("books")->paginate(10);
   
      return response()->json($data);
    }

    public function getSearchBooks($keyword){
        $data=DB::table("books")->where("title","LIKE","%".$keyword."%")->paginate(10);
      
        return response()->json($data);
      }

    //
}
