<?php

namespace App\Http\Middleware;

use Closure;

class login_juri
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
        if (!empty(session('juri'))) {
            return $next($request);
        }
        return redirect('/login');
    }
}
