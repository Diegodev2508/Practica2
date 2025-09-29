% Parte 1: Catálogo de vehículos
% Definimos 10 vehículos con marcas como Toyota, Ford, BMW, etc., y tipos válidos (SUV, Sedán, etc.).
vehiculo(toyota, rav4, suv, 28000, 2022).
vehiculo(toyota, corolla, sedan, 20000, 2023).
vehiculo(toyota, hilux, pickup, 35000, 2021).
vehiculo(ford, mustang, sport, 45000, 2023).
vehiculo(ford, explorer, suv, 40000, 2022).
vehiculo(ford, f150, pickup, 30000, 2021).
vehiculo(bmw, x5, suv, 60000, 2021).
vehiculo(bmw, serie3, sedan, 50000, 2023).
vehiculo(bmw, m4, sport, 70000, 2022).
vehiculo(honda, civic, sedan, 25000, 2023).
% Parte 2: Consultas y filtros básicos
% Predicado para filtrar por tipo y presupuesto.
cumplir_presupuesto(Referencia, PresupuestoMax) :-
vehiculo(_, Referencia, _, Precio, _),
Precio =< PresupuestoMax.
% Predicado para listado de vehículos por marca, usando bagof/3 para agrupar referencias por marca.
listado_por_marca(Marca, Lista) :-
bagof([Tipo, Ref], vehiculo(Marca, Ref, Tipo, _, _), Lista).
% Parte 3: Generación de informes.
% Predicado principal: generate_report(Marca, Tipo, Presupuesto, LimiteTotal, Resultado).
% Agregamos LimiteTotal como parámetro para manejar límites variables (ej. $1,000,000 o $500,000).
% Filtra por precio individual <= Presupuesto, ordena por precio ascendente y ajusta si excede LimiteTotal, priorizando menores precios.
generate_report(Marca, Tipo, Presupuesto, LimiteTotal, [ListaVehiculos, TotalPrecio]) :-
findall([Ref, Precio, Ano],
(vehiculo(Marca, Ref, Tipo, Precio, Ano), Precio =< Presupuesto),
Vehiculos),
sort(2, @=<, Vehiculos, VehiculosOrdenados),
ajustar_inventario(VehiculosOrdenados, LimiteTotal, ListaVehiculos, TotalPrecio).
% Ayudante: ajusta la lista si el total excede el límite.
ajustar_inventario(Vehiculos, Limite, ListaFinal, Total) :-
calcular_total(Vehiculos, TotalTemp),
(TotalTemp =< Limite ->
ListaFinal = Vehiculos, Total = TotalTemp
;
append(Inicial, [_], Vehiculos),  % Quita el último (el más caro).
ajustar_inventario(Inicial, Limite, ListaFinal, Total)
).
% Ayudante: calcula el total de precios en una lista de [Ref, Precio, Ano].
calcular_total([], 0).
calcular_total([[_, Precio, _]|Resto], Total) :-
calcular_total(Resto, TotalResto),
Total is TotalResto + Precio.
% Parte 4: Casos de prueba
% Aquí implementamos predicados o consultas en comentarios para facilitar la ejecución y capturas.
% Caso 1: Enumere todas las referencias de SUV de Toyota con precio inferior a $30,000.
% Consulta ejemplo (ejecuta en Prolog):
% findall(Ref, (vehiculo(toyota, Ref, suv, Precio, _), Precio < 30000), Resultado).
% Caso 2: Mostrar vehículos de la marca Ford utilizando bagof/3, agrupados por tipo y año.
% Predicado que agrupa: lista de [Tipo, Ano, Refs] donde Refs es la lista de referencias para esa combinación.
mostrar_vehiculos_ford_agrupados(Grupos) :-
findall([Tipo, Ano, Refs],
bagof(Ref, vehiculo(ford, Ref, Tipo, _, Ano), Refs),
Grupos).
% Caso 3: Calcular el valor total de un inventario filtrado por tipo “Sedán” sin superior a $500,000.
% Usa generate_report con Marca=, Tipo=sedan, Presupuesto alto (para no filtrar por precio individual) y LimiteTotal=500000.
% Consulta ejemplo (ejecuta en Prolog):
% generate_report(, sedan, 999999999, 500000, Resultado).