package org.lithan.spring.controllers;

import org.lithan.spring.repository.BiddingRepository;
import org.lithan.spring.repository.CarRepository;
import org.lithan.spring.repository.RoleRepository;
import org.lithan.spring.repository.UserRepository;
import org.lithan.spring.services.FilesStorageServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;

public class WebControllerBuilder {

   @Autowired
   CarRepository carRepository;

   @Autowired
   RoleRepository roleRepository;

   @Autowired
   FilesStorageServiceImpl filesStorageService;

   @Autowired
   UserRepository userRepository;

   @Autowired
   PasswordEncoder passwordEncoder;

   @Autowired
   BiddingRepository biddingRepository;

}
