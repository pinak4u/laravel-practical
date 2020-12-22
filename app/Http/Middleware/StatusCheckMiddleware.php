<?php

namespace App\Http\Middleware;

use Closure;

class StatusCheckMiddleware
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
        $allowedUrl = ['/user/home','/user/profile'];
        if(auth()->user()->status=='deactive')
        {
            auth()->logout();
            session()->flash('error', 'Your Account is Blocked, Please contact Admin to unblock your account');
            return redirect('/login');
        }

        if(auth()->user()->status=='suspended')
        {
            if(!in_array($request->getRequestUri(),$allowedUrl))
            {
                return redirect()->route('user.home');
            }
        }

        return $next($request);
    }
}
