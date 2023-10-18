<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
// use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('users')->insert([

            //Admin
            [
                "name" => 'Admin',
                "username" => 'admin',
                "email" => 'admin@gmail.com',
                "password" => Hash::make('111')

            ],

            //Vendor
            [
                "name" => 'Vendor',
                "username" => 'vendor',
                "email" => 'vendor@gmail.com',
                "password" => Hash::make('222')

            ],

            //user
            [
                "name" => 'User',
                "username" => 'user',
                "email" => 'user@gmail.com',
                "password" => Hash::make('333')

            ]

        ]);

        // $user = new User();
        // $user->name = "Admin";
        // $user->username = "admin";
        // $user->email = "admin@gmail.com";
        // $user->password = "111";

        // $user->save();
    }
}
