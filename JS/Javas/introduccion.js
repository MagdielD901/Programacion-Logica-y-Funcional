var ul = document.getElementById("lista");
let url = "https://thesimpsonsapi.com/api/";
let arr_original = [];
var lis = "";

var getLista = (page) => {
  fetch(url + "characters?page=" + page)
    .then((response) => {
      if (!response.ok) {
        console.log("Error en la red");
      }
      return response.json();
    })
    .then((data) => {
      console.log("Datos del personaje: ", data);

      data.results.forEach((personaje) => {
        arr_original.push({
          personaje: personaje,
          datos: null,
        });
        lis += `
         <li>
         <img src="https://cdn.thesimpsonsapi.com/500${personaje.portrait_path}" width="200px" />
         <h2>${personaje.name}</h2>
         </li>`;
      });
      ul.innerHTML = lis;
      console.log("ARREGLO FINAL", arr_original);
    });
};

for (let i = 1; i <= 5; i++) {
  getLista(i);
}

setTimeout(() => {
  document.getElementById("preloader").style.display = "none";
}, 1000);

//  img
const imprimir = (arr) => {
  var todo = "";
  arr.forEach((item) => {
    todo += `
         <li>
         <img src="https://cdn.thesimpsonsapi.com/500${item.personaje.portrait_path}" width="200px" />
         <h2>${item.personaje.name}</h2>
         </li>`;
  });
  ul.innerHTML = todo;
};

// Mostrar todos
document.querySelector("#mostrartodo").addEventListener("click", (evt) => {
  evt.preventDefault();
  imprimir(arr_original);
});

// Menores de edad
document.querySelector("#linkMenores").addEventListener("click", (evt) => {
  evt.preventDefault();
  let res = arr_original.filter(
    (item) => item.personaje.age < 18 && item.personaje.age != null
  );
  console.log("Menores de edad", res);
  imprimir(res);
});

// Muertos "Deceased"
document.querySelector("#linkMuertos").addEventListener("click", (evt) => {
  evt.preventDefault();
  let res = arr_original.filter(
    (item) =>
      item.personaje.status &&
      item.personaje.status.toLowerCase() === "deceased"
  );
  console.log("Muertos", res);
  imprimir(res);
});

// Promedio de edad
document.querySelector("#linkPromedio").addEventListener("click", (evt) => {
  evt.preventDefault();
  let edades = arr_original
    .map((item) => item.personaje.age)
    .filter((age) => age != null);
  let promedio =
    edades.reduce((acc, curr) => acc + curr, 0) / edades.length || 0;
  alert("Promedio de edad: " + promedio.toFixed(2));
});

// Ordenar por edad ascendente
document.querySelector("#linkOrdenarAsc").addEventListener("click", (evt) => {
  evt.preventDefault();
  let ordenados = [...arr_original].sort(
    (a, b) => (a.personaje.age || 0) - (b.personaje.age || 0)
  );
  imprimir(ordenados);
});

// Mostrar el más viejo y el más joven
document.querySelector("#linkExtremos").addEventListener("click", (evt) => {
  evt.preventDefault();
  let conEdad = arr_original.filter((item) => item.personaje.age != null);
  if (conEdad.length === 0) return alert("No hay edades registradas");
  let masViejo = conEdad.reduce((a, b) =>
    a.personaje.age > b.personaje.age ? a : b
  );
  let masJoven = conEdad.reduce((a, b) =>
    a.personaje.age < b.personaje.age ? a : b
  );
  imprimir([masViejo, masJoven]);
});

// Mostrar estudiantes
document.querySelector("#linkEstudiantes").addEventListener("click", (evt) => {
  evt.preventDefault();
  let res = arr_original.filter((item) =>
    item.personaje.occupation
      ? item.personaje.occupation.toLowerCase().includes("student")
      : false
  );
  console.log("Estudiantes", res);
  imprimir(res);
});

// Fecha de nacimiento < 1980/02/01
document.querySelector("#linkFecha").addEventListener("click", (evt) => {
  evt.preventDefault();
  let limite = new Date("1980-02-01");
  let res = arr_original.filter((item) => {
    if (!item.personaje.birthdate) return false;
    let fecha = new Date(item.personaje.birthdate);
    return fecha < limite;
  });
  console.log("Nacidos antes de 1980/02/01", res);
  imprimir(res);
});

// Buscador por frases 
document
  .querySelector(".search input[type='search']")
  .addEventListener("keypress", (evt) => {
    if (evt.key === "Enter") {
      let palabra = evt.target.value.toLowerCase();
      if (palabra.trim() === "") return alert("Ingrese una frase o palabra");

      let res = arr_original.filter((item) =>
        item.personaje.phrases.some((f) => f.toLowerCase().includes(palabra))
      );
      console.log("Coincidencias por frase", res);
      imprimir(res);
    }
  });


/*
Muertos
Menores de edad
Promedio de edad
ordenar por edad ascendente
Mostrar el mas viejo y el mas joven
Mostrar los que son estudiantes
Mostrar los items la fecha de nacimiento sea < 1980/02/01
Buscador por frases
*/

