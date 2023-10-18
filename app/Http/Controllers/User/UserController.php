<?php

namespace App\Http\Controllers\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\RedirectResponse;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class UserController extends Controller
{
    // user login
    public function user_dashboard(){
        $id = Auth::user()->id;
        $userInfo = User::find($id);
        return view('dashboard',compact('userInfo'));
    }

    // user Account update
    public function userAcUpdate(Request $request){
        $id = Auth::user()->id;
        $userInfo = User::find($id);
        $userInfo->name = $request->name;
        $userInfo->email = $request->email;

        if($image=$request->file('newphoto')){
            $customImageName = uniqid().'.'.$image->getClientOriginalExtension();
            @unlink(public_path('backend/upload/user/images/'.$userInfo->photo));
            $image->move(public_path('backend/upload/user/images/'),$customImageName);
        }else{
            $customImageName = $userInfo->photo;
        }

         $userInfo->photo = $customImageName;


        $userInfo->phone = $request->phone;
        $userInfo->address = $request->address;
        $userInfo->update();

        return redirect()->back()->with('status',"User Info Updated Successfully!");
    }


     // User userchangePassword
     public function userchangePassword(){
        return view('user_change_password');
      }
      // userpasswordUpdate
      public function userpasswordUpdate(Request $request){
         //Match old password
          if(!Hash::check($request->old_password,Auth::user()->password)){
              return back()->with('error',"Old Password Doesn't Match!!");
          }
  
          //update the password
          User::whereId(Auth::user()->id)->update([
              "password"=>Hash::make($request->new_password)
          ]);
          return redirect('/dashboard')->with('status',"Password Updated Successfully!");
        
      }
  


    // User logout
    public function userlogout(Request $request): RedirectResponse
    {
            Auth::guard('web')->logout();
    
            $request->session()->invalidate();
    
            $request->session()->regenerateToken();
    
            return redirect('/');
    }
}
