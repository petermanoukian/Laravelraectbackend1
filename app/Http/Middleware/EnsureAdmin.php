<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class EnsureAdmin
{
    public function handle(Request $request, Closure $next): Response
    {
        $user = $request->user();
        $roles = $user->getRoleNames();

        if ($user && ($user->hasRole('superadmin') || $user->hasRole('admin'))) {
            return $next($request);
        }

        return response()->json(['message' => "$roles Forbidden. Admin or Superadmin only."], 403);
    }
}

