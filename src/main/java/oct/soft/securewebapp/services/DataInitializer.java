/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package oct.soft.securewebapp.services;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.enterprise.context.Initialized;
import jakarta.enterprise.event.Observes;
import jakarta.inject.Inject;
import oct.soft.securewebapp.entities.User;

/**
 *
 * @author Octavian
 */
@ApplicationScoped
public class DataInitializer {

    @Inject
    DataService dataService;

    public void execute(@Observes @Initialized(ApplicationScoped.class) Object event) {
        if (dataService.getAllUsers().isEmpty()) {
            User sally = dataService.createUser("Sally Adams", "sally", "1234", "admin");
            User tom = dataService.createUser("Tom Matthews", "tom", "1234", "user");
            dataService.createQuality("Wonderful", tom);
            dataService.createQuality("Team Player", sally);
            dataService.createQuality("Good ead", sally);
            dataService.createQuality("Responsible", tom);
        }
    }
}
