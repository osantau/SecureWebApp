/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package oct.soft.securewebapp.controllers;

import java.util.List;
import jakarta.annotation.PostConstruct;
import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import oct.soft.securewebapp.entities.User;
import oct.soft.securewebapp.services.DataService;

/**
 *
 * @author Octavian
 */
@RequestScoped
@Named
public class UsersController {
    @Inject
    DataService dataService;
    List<User> allUsers;
    
    @PostConstruct
    public void initialize(){
        this.allUsers = dataService.getAllUsers();
    }

    public List<User> getAllUsers() {
        return allUsers;
    }
    
    
}
