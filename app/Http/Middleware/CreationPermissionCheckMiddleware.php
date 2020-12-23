<?php

namespace App\Http\Middleware;

use Closure;

class CreationPermissionCheckMiddleware
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
        if(!auth()->user()->hasPermissionTo('post-create')){
            return abort(403);
        }
        return $next($request);
    }
}
