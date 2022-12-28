/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.empleados.servicio;

import com.empleados.modelo.Empleado;
import com.empleados.repositorio.EmpleadoRepositorio;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Victor
 */
@Service
public class EmpleadoServicio {

    @Autowired
    EmpleadoRepositorio empleadoRepositorio;

    public List<Empleado> lista() {

        return empleadoRepositorio.listaEmpleados();

    }

    public Optional<Empleado> mostrarEmpleado(int id) {

        return empleadoRepositorio.obtenerEmpleado(id);

    }

    public void guardarEmpleados(Empleado empleado) {
        empleadoRepositorio.guardarEmpleado(empleado.getNombre(),
                empleado.getApellido(),
                empleado.getEmail(),
                empleado.getTelefono(),
                empleado.getPuesto(),
                empleado.getEmpresa());

    }

    public void editarEmpleados(int id,Empleado empleado) {
        empleadoRepositorio.editarEmpleado(empleado.getNombre(),
                empleado.getApellido(),
                empleado.getEmail(),
                empleado.getTelefono(),
                empleado.getPuesto(),
                empleado.getEmpresa(),
                id
        );

    }
    
    public void eliminarEmpleados(int id){
        empleadoRepositorio.eliminarEmpleado(id);
        
    }

}
