<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class FrontendController extends Controller
{
    //Home Page
    public function index(){
        return view('frontend.index');
    }
}
