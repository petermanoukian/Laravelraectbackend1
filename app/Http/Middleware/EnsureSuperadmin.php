<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class EnsureSuperadmin
{
    public function handle(Request $request, Closure $next): Response
    {
        $user = $request->user();
		$roles = $user->getRoleNames();
		   if ($user && $user->hasRole('superadmin')) {
				return $next($request);
			}

        return response()->json(['message' => " $roles Forbidden. Superadmin only."], 403);
    }
}
