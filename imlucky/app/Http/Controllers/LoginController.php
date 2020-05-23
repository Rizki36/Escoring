<?php

namespace App\Http\Controllers;

use App\Juri;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;

class LoginController extends Controller
{
    public function index()
    {
        return view('login-juri');   
    }

    public function indexAdmin()
    {
        return view('login-admin');
    }

    public function post(Request $request)
    {
        $username = $request->username;
        $password = $request->password;
        $juri =Juri::where('kode',$username)->where('password',$password)->get();
        if($juri->count() > 0){
            $request->session()->put('juri',$juri->first());
            return redirect()->intended('/juri/peleton/1');
        }
        $request->session()->flash('status','Username atau Password salah!');
        return redirect()->back()->withInput();
    }

    public function postAdmin(Request $request)
    {
        if ($request->input('username') === config('app.admin') && $request->input('password') === config('app.password')) {
            $request->session()->put('admin',time());
            return redirect()->intended('admin');
        }
        $request->session()->flash('status','Username atau Password salah!');
        return redirect()->back()->withInput();        
    }

    public function logout()
    {
        session()->flush();
        return redirect('login');
    }

    public function logout_juri()
    {
        session()->pull('juri');
        return redirect('/login');
    }

    public function logout_admin()
    {
        session()->pull('admin');
        return redirect('/login/admin');
    }
}
