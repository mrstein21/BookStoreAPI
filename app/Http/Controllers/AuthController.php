<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request; 
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
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


    public function Register(Request $request){
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|unique:users',
            'password' => 'required|string',
            "confirmation_password"=>'required|string'
        ]);

        if ($validator->fails()) {
            return response()->json(["success"=>"0","message"=>$validator->messages()->first()]);
        }

        if($request->password!=$request->confirmation_password){
            return response()->json(["success"=>"0","message"=>"Password doesn't match"]);
        }

        $id=DB::table("users")->insertGetId([
            "name"=>$request->name,
            "email"=>$request->email,
            "password"=>Hash::make($request->password),
        ]);

        return response()->json(["success"=>"1","message"=>"Register success",
          "data"=>[
            "name"=>$request->name,
            "email"=>$request->email,
            "id"=>$id
          ]
        ]);
    }

    public function Login(Request $request){
        $validator = Validator::make($request->all(), [
            'email' => 'required',
            'password' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(["success"=>"0","message"=>$validator->messages()->first()]);
        }

        $users=DB::table("users")->where("email",$request->email)->first();
        if(Hash::check($request->password,$users->password)){
            return response()->json(["success"=>"1","message"=>"Login Succeed","data"=>$users]);
        }

        return response()->json(["success"=>"0","message"=>"Wrong username or Password"]);

    }

    





    //
}
