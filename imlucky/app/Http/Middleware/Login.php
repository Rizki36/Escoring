<?php

namespace App\Http\Middleware;

use Closure;

class Login
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if(!empty(session('admin'))){
            $request->session()->put('admin',time());
            return $next($request);
        }

        if(!empty(session('juri'))){
            $request->session()->put('juri',time());
            return $next($request);
        }
        
        return redirect('/login');
    }
}
