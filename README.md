# 🚗 ST0244 - Lenguajes y Paradigmas de Programación  

👨‍🏫 **Profesor:** Alejandro Narvaez Berrío  
👨‍🎓 **Estudiantes:**  
- Diego Andres Caballero Fernandez  
- Juan Diego Muñoz Buitrago  

---

## 📌 Práctica 2: Sistema de Gestión de Ventas de Vehículos en Prolog  

### 🛠️ Plataformas utilizadas  
- 💻 **SWI-Prolog**  
- 🖥️ **CMD**  

🔹 Programa desarrollado **100% en Prolog**  

---

## ✨ Características principales  

- 📋 Administración de un **catálogo de vehículos** representados con el predicado:  
  ```prolog
  vehiculo(Marca, Referencia, Tipo, Precio, Año).
````

* 🚙 Catálogo con **10 vehículos de ejemplo** de distintas marcas (Toyota, Ford, BMW, Honda) y tipos (SUV, Sedán, Pickup, Sport).
* 🔎 **Consultas y filtros básicos**:

  * Verificación de presupuesto máximo (`cumplir_presupuesto/2`).
  * Listados por marca usando `bagof`.
* 📊 **Generación de informes avanzados** con `generate_report/5`:

  * Filtrar por marca, tipo y presupuesto.
  * Ordenar por precio ascendente.
  * Ajustar inventario si se supera el límite total.
* ✅ Casos de prueba incluidos para validar **agrupación, filtrado y control de inventario**.

---

## 🏁 Conclusión

El sistema desarrollado en **Prolog** permite:

* ⚡ Gestionar eficientemente un inventario de vehículos.
* 🧩 Aplicar filtros, consultas y restricciones.
* 🔄 Simular escenarios reales de **gestión de ventas**.
* 🔍 Usar predicados como `findall` y `bagof` para **búsquedas y agrupaciones eficientes**.

---

💡 *Este proyecto demuestra cómo Prolog puede utilizarse en aplicaciones reales de gestión de datos y ventas.*

```
