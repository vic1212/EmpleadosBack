/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.empleados.repositorio;

import com.empleados.modelo.Empleado;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author Victor
 */
public interface EmpleadoRepositorio extends JpaRepository<Empleado, Integer> {

    @Query(value = "{call SP_ListaEmpleado()}", nativeQuery = true)
    List<Empleado> listaEmpleados();

    @Query(value = "{call SP_MostrarEmpleado(:idEntrada)}", nativeQuery = true)
    Optional<Empleado> obtenerEmpleado(@Param("idEntrada") int idEntrada);

    @Query(value = "{call SP_InsertarEmpleados(:NOMBRE,:APELLIDOS,:EMAIL,:TELEFONO,:PUESTO,:EMPRESA)}", nativeQuery = true)
    public void guardarEmpleado(
            @Param("NOMBRE") String nombre,
            @Param("APELLIDOS") String apellidos,
            @Param("EMAIL") String email,
            @Param("TELEFONO") String telefono,
            @Param("PUESTO") String puesto,
            @Param("EMPRESA") String empresa
    );

    @Query(value = "{call SP_EditarEmpleados(:NOMBRE,:APELLIDOS,:EMAIL,:TELEFONO,:PUESTO,:EMPRESA,:IDEMPLEADO)}", nativeQuery = true)
    public void editarEmpleado(
            @Param("NOMBRE") String nombre,
            @Param("APELLIDOS") String apellidos,
            @Param("EMAIL") String email,
            @Param("TELEFONO") String telefono,
            @Param("PUESTO") String puesto,
            @Param("EMPRESA") String empresa,
            @Param("IDEMPLEADO") int idemplado
    );
    
    @Query(value = "{call SP_EliminarEmpleado(:idEmpleado)}", nativeQuery = true)
    public void eliminarEmpleado(@Param("idEmpleado") int idEmpleado);

}
