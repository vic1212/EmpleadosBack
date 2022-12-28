/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.empleados.controlador;

import com.empleados.modelo.Empleado;
import com.empleados.servicio.EmpleadoServicio;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Victor
 */
@RestController
@RequestMapping("/empleados")
@CrossOrigin(origins = "http://localhost:4200/")
public class EmpleadoControlador {

    @Autowired
    EmpleadoServicio empleadoServicio;

    //Metodo para listar empleados
    @GetMapping("/lista")
    public ResponseEntity<List<Empleado>> lista() {
        List<Empleado> lista = empleadoServicio.lista();
        return new ResponseEntity(lista, HttpStatus.OK);
    }

    @GetMapping("/empleado/{id}")
    public ResponseEntity<Empleado> verEmpleado(@PathVariable("id") int id) {
        Optional<Empleado> empleado = empleadoServicio.mostrarEmpleado(id);
        return new ResponseEntity(empleado, HttpStatus.OK);
    }

    @PostMapping("/nuevo")
    public ResponseEntity<HttpStatus> guardaEmpleado(@RequestBody Empleado empleado) {
        empleadoServicio.guardarEmpleados(empleado);
        
        return new ResponseEntity("Empleado Guardado",HttpStatus.CREATED);
    }
    
     @PutMapping("/editar/{id}")
    public ResponseEntity<HttpStatus> editaEmpleado(@PathVariable("id") int id,@RequestBody Empleado empleado) {
        empleadoServicio.editarEmpleados(id,empleado);
        
        return new ResponseEntity("Empleado actualizado",HttpStatus.CREATED);
    }
    
    @DeleteMapping("/borrar/{id}")
    public ResponseEntity<HttpStatus> borrarEmpleado(@PathVariable("id") int id){
        empleadoServicio.eliminarEmpleados(id);
        return new ResponseEntity("Empleado Eliminado", HttpStatus.OK);
    }
    

}
