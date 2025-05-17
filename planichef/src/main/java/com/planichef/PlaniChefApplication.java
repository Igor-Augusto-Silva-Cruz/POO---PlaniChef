package com.planichef;

import org.apache.catalina.startup.Tomcat;
import org.apache.catalina.Context;
import org.apache.catalina.LifecycleException;
import java.io.File;

public class PlaniChefApplication {
    public static void main(String[] args) {
        try {
            // Criar instância do Tomcat
            Tomcat tomcat = new Tomcat();
            
            // Configurar porta
            tomcat.setPort(8080);
            
            // Configurar diretório base
            String baseDir = new File(".").getAbsolutePath();
            tomcat.setBaseDir(baseDir);
            
            // Configurar contexto da aplicação
            Context context = tomcat.addWebapp("/planichef", new File("src/main/webapp").getAbsolutePath());
            context.setReloadable(true);
            
            // Iniciar o servidor
            tomcat.start();
            System.out.println("Servidor iniciado em http://localhost:8080/planichef");
            tomcat.getServer().await();
            
        } catch (LifecycleException e) {
            System.err.println("Erro ao iniciar o servidor: " + e.getMessage());
            e.printStackTrace();
        }
    }
} 