<?php

namespace App\Http\Middleware;

use App\Post;
use Closure;

class OwnerCheckMiddleware
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
        $user_id = Post::find($request->segment(2))->user_id;
        if(auth()->user()->id!=$user_id || auth()->user()->id !=1)
        {
            return abort(403);
        }
        return $next($request);
    }
}
