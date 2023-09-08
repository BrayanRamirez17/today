class Pasajero:
    def __init__(self, nombre, apellido, edad, pasaporte) -> None:
        self.nombre = nombre
        self.apellido = apellido
        self.edad = edad
        self.pasaporte = pasaporte

    def mostrarInformacion(self):
        return f"Nombre: {self.nombre} {self.apellido}\nEdad: {self.edad}\nPasaporte: {self.pasaporte}"

class Vuelo:
    def __init__(self, numero, origen, destino, capacidad) -> None:
        self.numero = numero
        self.origen = origen
        self.destino = destino
        self.capacidad = capacidad
        self. asientos_disponibles = capacidad
        self.reservas = []

    def mostrarInformacion(self):
        return f"Vuelo {self.numero}: {self.origen} - {self.destino}\nAsientos disponibles: {self.asientos_disponibles}/{self.capacidad}"
    
    def reservarAsientos(self,pasajero):
        if pasajero in self.reservas:
            return "El pasajero ya tiene un vuelo reservado"
        if self.asientos_disponibles>0:
            self.reservas.append(pasajero)
            self.asientos_disponibles -=1
            return f"Reserva exitosa para el pasajero {pasajero.nombre} {pasajero.apellido}"
        else:
            return f"No hay cupo en el avion"

    def cancelarReserva(self,pasajero):
        if pasajero in self.reservas:
            self.reservas.remove(pasajero)
            self.asientos_disponibles +=1
            return f"La reserva del pasajero {pasajero.nombre} {pasajero.apellido} se canceló exitosamente"
        else:
            return f"No se encuentra reserva para pasajero {pasajero.nombre} {pasajero.apellido}"
        
class ReservarVuelos:
    def __init__(self) -> None:
        self.vuelos_disponibles = []

    def agregarVuelo(self,vuelo):
        if vuelo in self.vuelos_disponibles:
            return f"El vuelo ya esta registrado en el sistema"
        else:
            self.vuelos_disponibles.append(vuelo)
            return f"El vuelo numero: {vuelo.numero} se registró exitosamente"
        
    def buscarVuelo(self,numerovuelo):
        for i in self.vuelos_disponibles:
            if i.numero == numerovuelo:
                return i.mostrarInformacion()
            else:
                return f"El vuelo no se encuentra registrado en el sistema"
            
    def vuelosDisponibles(self):
        for i in self.vuelos_disponibles:
            print(f"{i.mostrarInformacion()}\n")
        

        

pasajero1 = Pasajero("Thomas", "Wayne", 29, 123456)
pasajero2 = Pasajero("Maria", "Banana", 24, 98765)
vuelo1 = Vuelo(123, "Medellin", "Bogota", 1)
vuelo2 = Vuelo(321, "Medellin", "Cartagena", 5)
reserva = ReservarVuelos()

# print(vuelo1.reservarAsientos(pasajero1))
# print(vuelo1.reservarAsientos(pasajero2))
# print(vuelo1.mostrarInformacion())

print(reserva.agregarVuelo(vuelo1))
print(reserva.agregarVuelo(vuelo2))
# print(reserva.buscarVuelo(321))
reserva.vuelosDisponibles()