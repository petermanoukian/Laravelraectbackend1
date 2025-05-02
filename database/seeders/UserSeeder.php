<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Role; // Ensure you have the Spatie role package
use Faker\Factory as Faker;

class UserSeeder extends Seeder
{
    public function run()
    {
        $faker = Faker::create();

        $roles = ['superadmin', 'admin', 'user'];

        foreach (range(1, 50) as $index) {
            // Create user
            $user = User::create([
                'name' => $faker->name,
                'email' => $faker->unique()->safeEmail,
                'password' => Hash::make('password'), // You can customize the password if needed
            ]);

            // Assign a random role to the user
            $role = $roles[array_rand($roles)]; // Randomly pick one of the roles
            $user->assignRole($role);
        }
    }
}
