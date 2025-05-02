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

        if ($user && $user->role === 'superadmin') {
            return $next($request);
        }

        return response()->json(['message' => 'Forbidden. Superadmin only.'], 403);
    }
}
