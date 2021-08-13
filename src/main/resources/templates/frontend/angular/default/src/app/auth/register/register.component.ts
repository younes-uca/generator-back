import { Component, OnInit } from '@angular/core';
import { FormControl, FormControlName, FormGroup, Validators } from '@angular/forms';
import { User } from 'src/app/controller/model/User.model';
import { AuthService } from 'src/app/controller/service/Auth.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent implements OnInit {
  registerForm = new FormGroup({
    firstName : new FormControl('',Validators.required),
    lastName : new FormControl('',Validators.required),
    email:new FormControl('',Validators.required),
    userName : new FormControl('',Validators.required),
    password : new FormControl('',Validators.required)
  })
  constructor(private authService:AuthService) { }

  ngOnInit(): void {
  }
  submit(){
    const formValues = this.registerForm.value;
    const {firstName,lastName,userName,password} = formValues;
    this.user.firstName = firstName;
    this.user.lastName = lastName;
    this.user.username = userName;
    this.user.password = password;
    this.authService.register()

  }
    get user(): User {
        return this.authService.user;
    }

    set user(value: User) {
        this.authService.user = value;
    }

}
