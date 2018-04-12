/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connectbook;

/**
 *
 * @author Pranav
 */

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;

@SpringBootApplication
public class Application  {
  
  
  
    public static void main(String[] args) {
    	System.setProperty("server.port", "5000");
        SpringApplication.run(Application.class, args);
    }

}