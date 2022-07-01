### A Pluto.jl notebook ###
# v0.17.2

using Markdown
using InteractiveUtils

# ╔═╡ 1f108e40-daf3-40c5-a350-a62caeb756b3
using PlutoUI

# ╔═╡ 90171d30-92d9-4b10-885f-bcdff507190b
PlutoUI.TableOfContents()

# ╔═╡ d7fbf5f2-3de5-11ec-0df0-719272a0eca6
md"
# Funciones y métodos especializados
En esta sección se revisarán la declaración de funciones en Julia y la creación de estructuras de datos definidas por el usuario, elementos que conforma el concepto fundametal de programación de Julia, el despacho múltiple.
"

# ╔═╡ 02ca2c24-a348-4cc6-adb6-d0db31ecd930
md"
## Declaración de una función
En Julia es posible declarar una función de distintas formas, la más común es declarar utilizando las palabras reservadas `function` y `end` acompañadas del nombre que identifica a la función.
"

# ╔═╡ 3dd2a099-92cc-44ad-9d55-bbdcdeed5b11
function saludo(name)
    Print("Hola $name, aprendamos Julia!!")
end

# ╔═╡ 5e40a4f5-2ce0-46bc-9e09-55bd3682e41a
function saludo(name1, name2)
    Print("Hola $name1, $name2, aprendamos Julia!!")
end

# ╔═╡ a61def1e-755d-4111-989d-ecd8a24453c8
function f(x)
    x ^ 2
end

# ╔═╡ b34bbe5e-15d3-4d38-9b79-0155e1478ec9
md"
En la declaración anterior no se especificó la palabra reservada `return` para devolver algún valor calculado en la función. Por defecto Julia devuelve el resultado de la última sentencia ejecutable dentro de la función, no obstante se puede especificar el valor de regreso haciéndolo explícito.
"

# ╔═╡ 18bd19e7-d417-4b57-8552-955684848439
function g(x)
    return x ^ 3
end

# ╔═╡ a84ba980-2aba-4099-955f-cf0e475b3e25
saludo("Oscar") 

# ╔═╡ dedb61ff-4bca-4d9f-b202-e9bfbbf7351c
saludo("Oscar", "Claudia")

# ╔═╡ 385f7fed-15a7-4b70-be33-57d499bb8bbf
md"
Nótese la doble declaración de la función `saludo` descrita como: ''_funcion with 2 methods_''. La primera declaración recibe un argumento, las segunda recibe dos argumentos, la versión de `saludo` que coincida con en número y tipo de datos con los que se invoca será la que se ejecute.
"

# ╔═╡ 2fce8a1c-5ff3-4dc7-bfc5-6982d440ad93
f(5)

# ╔═╡ 8c1f4189-b0ee-4c50-932f-da3720f8bd65
g(5)

# ╔═╡ 0b49372b-0066-4b86-ac3e-f8b0582248be
md"
Otra forma de declarar funciones es omitiendo las palabras reservadas `function` y  `end`. Esta forma es más parecida a la notación matemática convencional para definir funciones.
"

# ╔═╡ ede60bb2-2a57-4cd6-8dc3-b7a898b116c2
saludo1(name) = Print("Hola $name, aprendamos Julia!!")

# ╔═╡ 4c441b65-47ce-4ff1-9a75-346735ff0d74
f1(x) = x ^ 3

# ╔═╡ ab176329-a068-41f9-9762-9ac4809c1b27
saludo1("Arturo")

# ╔═╡ fd2e8299-7864-4d88-80ea-120962456f03
f1(5)

# ╔═╡ 43e23ecd-ab4e-49da-a0d4-181b2ef13953
md"
Una forma más de declarar funciones en Julia es declaración de una función *anónima*. Este tipo de declaración es similar en concepto al de las funciones lambda en Python.
"

# ╔═╡ c81cf58e-ee27-48ed-8b74-b69641b14477
name -> Print("Hola $name, aprendamos Julia!!")

# ╔═╡ 4ef5c76d-6fd4-45d3-92ae-09204c97bb92
(name1, name2) -> Print("Hola $name1, $name2, aprendamos Julia!!")

# ╔═╡ f5fdf62f-d6b9-4c8b-b115-aaef438ad0a7
md"
Una función declarada de esta forma carece de nombre y solo tiene la especificación del argumento (s) que recibe, separada del cuerpo de la función por `->`. Pareciera que no hay forma de acceder a una función anónima, sin embargo, funciones que ''no tienen nombre'' son utilizadas en varios casos específicos.

Si se desea utilizar una función anónima es posible asignarla a una variable (_binding_).
"

# ╔═╡ f5b9c790-9a00-4ce3-9ce7-21678dfdc7c3
hola1 = name -> Print("Hola $name, aprendamos Julia!!")

# ╔═╡ 45241c71-8c6c-4e0b-9231-b744ccce080d
hola2 = (name1, name2) -> Print("Hola $name1 y $name2, aprendamos Julia!!")

# ╔═╡ add5e698-4911-4474-8587-054472dc5a93
hola1("Adriana")

# ╔═╡ 1b07883b-15ae-46ca-9129-e928e473e087
hola2("Daniel", "Cristina")

# ╔═╡ 393df60e-005f-4b42-888b-1d460570482f
f2 = x -> x ^ 2

# ╔═╡ 5003d44b-c0dd-4901-981b-b6be5b2e16f9
f2(5)

# ╔═╡ 1a26ba38-3598-4e41-acb1-9a8b38c506b3
md"
## Duck-typing en Julia
Las funciones en Julia siempre funcionarán para entradas para las cuales **encuentre sentido**: _''Si grazna como pato, camina como pato, entonces es un pato''_.
"

# ╔═╡ fa213a11-cbbd-40a2-a780-3f0a2fbf7ca4
saludo(3.14159)

# ╔═╡ 916610cc-555a-42b7-8033-ad79238b986f
f("hola")

# ╔═╡ 12c42a78-70b5-4422-8cd6-85069aaede0c
begin
	A = rand(3,3)
	A
end

# ╔═╡ fbcc6b8e-cc42-409a-a99d-0007c1e35434
f(A)

# ╔═╡ 29772da5-16a2-4616-b82d-45b59a6904d0
md"
La función `f(x) = x ^ 2` funciona para números enteros, reales o una matriz. También funciona para una cadena de caracteres pues el operador `^` opera para cadenas de caracteres.
"

# ╔═╡ 90d7fab6-b49c-467a-bf2b-50385ac3c1f8
md"
Por otra parte, la función f no funcionará con un vector como argumento puesto que `v ^ 2` no es una operación que esté definida, a diferencia de `A ^ 2` que sí lo está.
"

# ╔═╡ 78803268-3036-460f-b379-b11cfa06eb8c
begin
	v = rand(3)
	f(v)
end

# ╔═╡ 82e006fe-0df9-4b1f-9a69-5106fc581e30
md"
## Funciones mutables
En Julia es posible forzar que una función predefinida modifique el argumento al cual se aplica, por convención las funciones seguidas de `!` alteran sus contenidos.
"

# ╔═╡ 841a6329-9438-4145-8974-ed09db9a7f08
vv = [3, 5, 2]

# ╔═╡ ba0cf5c6-a4ca-4c19-8408-aba3387e8041
sort(vv)

# ╔═╡ a443715d-ce7c-4f86-9982-c3d8db9c0d95
vv

# ╔═╡ 5dcdef11-0a29-44fe-a91a-eae01dde0d24
sort!(vv)

# ╔═╡ 6b3ad624-ba42-4b75-9f01-6a066aa03668
vv

# ╔═╡ 401d355e-cbf9-4ad4-a6f8-fe4d99bc9afe
md"
`sort(v)` devuelve un arrego ordenado que contiene los mismos elementos de `v` sin alterar a `v`. `sort!(v)` altera el argumento `v` que se le pasa a la función.
"


# ╔═╡ 7f2f2ea2-3ba8-4b8b-80f0-2ce537d9b3d3
md"
## Funciones de orden superior
La función `map()` es una función en Julia que toma como uno de sus argumentos de entrada una _función_. `map()` aplica la función a cada elemento de la estructura de datos que se le pasa como segundo argumento.
Por ejemplo, al ejecutar:
```julia
map(f,[1, 2, 3])
```
obtendremos un arreglo de salida donde la función `f()` se aplica a cada uno de los elementos del array `[1, 2, 3]`, es decir:
```julia
[f(1), f(2), f(3)]
```
"

# ╔═╡ 6e9b9e74-1b1e-47aa-9f67-b5fdcf198d48
map(f,[1, 2, 3])

# ╔═╡ 25355210-a0f2-4df7-8144-8d5d10b3bb3c
md"
Se han elevado al cuadrado cada elemento de `[1, 2, 3]` en lugar de elevar al cuadrado el vector mismo. Una forma alternativa para usar la función `map()` es acompañarla de una función anónima:
"

# ╔═╡ e18886ff-b1b1-4b22-988c-94eba958a9c8
myfunc = x -> x ^ 3

# ╔═╡ 4cd8ff39-0252-4c50-a4a3-4658d3fecb37
map(myfunc, [1,2,3])

# ╔═╡ ab0c2eef-e56d-4e8b-9ba9-765001599794
map(x -> x^3, [1, 2, 3])

# ╔═╡ 534e7c66-e3c8-483c-a527-38ec0bce8972
md"
Otra función de orden superior es aquella que aplica la operación de **Broadcast**, esto es que se lleva acabo la ''expansión de la dimensión unaria'' de los objetos que se pasan a la función.
Como ejemplo se aplicará `f()` a una matriz `M`, la operación de _broadcast_ extenderá el mapeo de f() a todos los elementosn de M:
"

# ╔═╡ 7e4f4e5d-6b8b-4067-9402-c7905d006a2b
md"
Lo anterior ejecuta:
```julia
f(A) = A^2 = A * A
```
es decir, se aplicó la multiplicación matricial común. 
"

# ╔═╡ d01eb8ee-f123-4d3b-916e-879204b6c1c6
md"
En este caso se aplicó el operador punto `.` para indicar el _broadcast_ de `f()` sobre M, es decir, f.(M) que devuelve el cuadrado cada elemento de M.

El uso del operador `.` permita hacer _broadcast_ de cualquier operador aritmético lo cual permite escribir composiciones complejas de expresiones en una manera más natural y cercana a la notación matemática convencional.
"

# ╔═╡ b518d0e4-900c-40d0-8ecf-a727db10cba4
md"
## Operadores como funciones
En Julia los operadores aritméticos puedes aplicarse utilizando la notación de función:
"

# ╔═╡ 3fc622c1-fe5a-4c8f-a2d6-227c1a03d51f
3 // 4)

# ╔═╡ 7692d93e-a562-4d8a-b139-05c9b0cc896c
//(3, 4)

# ╔═╡ 2280337a-e409-49fa-b9a3-872b3fd15f1a
md"
En efecto, un operador aritmético en Julia es una función que tiene diversas implementaciones o _métodos_:
"

# ╔═╡ cbb433cd-6f8f-4133-b4bd-00b37d71c1e9
//

# ╔═╡ e733b36f-7e45-41f3-94bd-efd9f91addc0
methods(//)

# ╔═╡ 999b22dc-740e-4a94-85e0-384e466db7ab
md"
Esto es el fudamento de lo que se denomina **despacho múltiple**. 

Como puede observarse, se está definiendo una versión o método de la función (operador) que acepta argumentos de cierto tipo. Para el operador `//` hay ocho combinaciones de tipos de datos con los que le será posible operar.

En general, las funciones se implementan especificando la acción que llevará acabo sobre diferentes tipos de datos, en las **funciones genéricas** no se especifica qué tipo de dato aceptan, al igual que en Python funcionarán siempre que las operaciones realizadas en ellas tengan sentido para el valor de entrada.
"

# ╔═╡ cbab5c69-fdff-4fee-95f7-467ffbb56cc4
duplicar(x) = x^2

# ╔═╡ d19244e0-ccec-4b95-b63f-c27bcd0a7771
duplicar(3)

# ╔═╡ 50ff754f-0ada-48df-99fc-c992adf8ce8b
duplicar(3.5)

# ╔═╡ d3e58e15-5527-4013-8095-5c614040e51c
 duplicar("hola")

# ╔═╡ 37380c83-e73b-48ff-b95d-8fbd2453db4d
md"
En Julia, la concatenación de cadenas se lleva acabo mediante el operador `*` en sustitución del operador `+` como se haría en Python. Por tanto, repetir una cadena es equivalente a aplicar una potencia a un valor entero.
"

# ╔═╡ f235fb6f-442b-48ee-918b-747f243f58ce
"hello" ^ 2  # duplica

# ╔═╡ 883f2137-6c02-44fb-a273-fc06171d15ed
"hello" * "world"  # concatena

# ╔═╡ c00aabaf-b3f7-4222-95ca-5f51a1104c18
md"
## Métodos especializados
Nótes que el operador suma `+` **no está definido** para recibir dos cadenas de caracteres y las concatene, ¿para cuáles tipos de datos está definido?
"

# ╔═╡ d8d8ab10-c22e-4f59-9376-d65639827d20
md"
La funcionalidad del operador `+` se elabora mediante la implementación de múltiples métodos que reciben distintos tipos de datos los cuales son considerados como **versiones especializadas** de dicho operardor, el cual es tratado como una función con número y tipo de parámetros específicos.
"

# ╔═╡ 0a95875e-ffa2-4567-9582-9d727729a000
md"
Dado el caso que **no** se desee utilizar el operador `*` para la concatenación de cadenas, Julia permite **definir un nuevo método** para que el operador `+` sea utilizado para tal efecto.

Primeramente, considerese la función `string()` la cual permite concatenar dos cadenas de caracteres:
"

# ╔═╡ fa49855f-e0c7-4b2b-a005-65852eeb1f4b
string("Hello", "world")

# ╔═╡ 58546405-7ca9-4221-a1eb-789030be36a9
md"
La nueva funcionalidad de `+` se implementa mediante la creación de una función que reciba dos argumentos de tipo `String` y que ejecute la función `string()`. El nuevo método utilizará  `+()` que recibirá dos argumentos, `s1` y `s2`,  definidos por el especificador de tipos `::` como `String`, esta función ejecutará `string(s1, s2)`: 

```Julia
+(s1::String, s2::String) = string(s1,s2)
```
"

# ╔═╡ 492fc49f-494b-443e-82b3-e31fa46545e5
md"
Antes de implementar el nuevo método, se desea concatenear una cadena de caracteres y un valor numérico mediante el operador `+`, sin embargo tampoco existe un método que opere para un tipo `String` y un tipo `Number`:
Por ejemplo:
```
``El valor de x es: `` + 3
```
produce un error
"

# ╔═╡ 5c572632-aad4-48db-b098-31cc0f28d071
md"
Para definir un nuevo método de `+` que opere con una cadena de caracteres y la representación de cadena de un valor numérico es posible aprovechar el nuevo método implementado anteriormente, lo que resulta en:
```Julia
+(s::String, x::Number) = s + ``$x``
```
"

# ╔═╡ 65251f46-8cee-4503-81c3-768a92717d84
md"
La implementación de los dos nuevos métodos de `+` queda de la siguiente manera:
"

# ╔═╡ 6ff23055-5e2c-4d2a-a83d-533a5334e1ac
begin
	import Base.+
	+(s1::String, s2::String) = string(s1,s2)
	+(s::String, x::Number) = s + "$x"
end

# ╔═╡ c249e441-5a6a-4414-89d8-546832b97df4
M = [i + 3*j for j in 0:2, i in 1:3]

# ╔═╡ 5a1463c0-f201-47c4-a131-cd51eca136f8
f(M) # aplica f elemento a elemento

# ╔═╡ a72f50bf-2319-4064-91e7-8e6075f00ecc
f.(M)

# ╔═╡ 5337ed05-53d5-4733-b185-ec085ec8da13
M

# ╔═╡ cad7655b-d3fa-466e-9d0a-595dd36d6b06
M .+ 2 .* f.(M) ./ M

# ╔═╡ eb365b91-4f93-4a38-bfa0-f7b1f9c7ba51
3 + 4

# ╔═╡ c50f6d22-1a70-471d-a123-3e10c4e3f19d
+(3, 4)

# ╔═╡ 89f7ae2b-345e-4374-b212-377d122b19c7
"hello " + "world" # error

# ╔═╡ 985466e9-95d2-4733-810d-8c3df45c95c7
+

# ╔═╡ 5f3982a7-9ac3-4610-a5a7-b4f7a7d66796
methods(+)

# ╔═╡ c59a8420-3c1a-4a29-ab98-941cab80e526
md"
Cabe hacer notar que previamente a la definición de los dos nuevos versiones especializadas debe importarse el módulo `Base.+` donde están los métodos de `+`. De esta forma, es posible hacer:
"

# ╔═╡ 9a3e1264-93e4-4f97-be39-41c37bc4a4bc
"Hello" + "world"

# ╔═╡ 6779ce1e-8b5e-40b7-9285-05c83c08d95a
"El valor de x es: " + 3

# ╔═╡ 8f91a4ba-aaa2-4b41-83ce-0b9520500d94
md"
Más aún, puede hacerse:
"

# ╔═╡ 0fa9e29a-9d9b-4882-b2f6-a3de01d0c833
"Complex: " + (3 + im)

# ╔═╡ ce08a224-13f3-4660-bbe1-cf6e1005361c
"Cadena_" .+ [1,2,3]

# ╔═╡ ffdf9c2f-cd41-42b1-a56c-91594440c6ba
md"
¡Se ha implementado el **despacho múltiple**!
"

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.16"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[HypertextLiteral]]
git-tree-sha1 = "5efcf53d798efede8fee5b2c8b09284be359bf24"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.2"

[[IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "f19e978f81eca5fd7620650d7dbea58f825802ee"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.1.0"

[[PlutoUI]]
deps = ["Base64", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "4c8a7d080daca18545c56f1cac28710c362478f3"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.16"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
"""

# ╔═╡ Cell order:
# ╠═1f108e40-daf3-40c5-a350-a62caeb756b3
# ╠═90171d30-92d9-4b10-885f-bcdff507190b
# ╟─d7fbf5f2-3de5-11ec-0df0-719272a0eca6
# ╟─02ca2c24-a348-4cc6-adb6-d0db31ecd930
# ╠═3dd2a099-92cc-44ad-9d55-bbdcdeed5b11
# ╠═5e40a4f5-2ce0-46bc-9e09-55bd3682e41a
# ╠═a61def1e-755d-4111-989d-ecd8a24453c8
# ╟─b34bbe5e-15d3-4d38-9b79-0155e1478ec9
# ╠═18bd19e7-d417-4b57-8552-955684848439
# ╠═a84ba980-2aba-4099-955f-cf0e475b3e25
# ╠═dedb61ff-4bca-4d9f-b202-e9bfbbf7351c
# ╟─385f7fed-15a7-4b70-be33-57d499bb8bbf
# ╠═2fce8a1c-5ff3-4dc7-bfc5-6982d440ad93
# ╠═8c1f4189-b0ee-4c50-932f-da3720f8bd65
# ╟─0b49372b-0066-4b86-ac3e-f8b0582248be
# ╠═ede60bb2-2a57-4cd6-8dc3-b7a898b116c2
# ╠═4c441b65-47ce-4ff1-9a75-346735ff0d74
# ╠═ab176329-a068-41f9-9762-9ac4809c1b27
# ╠═fd2e8299-7864-4d88-80ea-120962456f03
# ╟─43e23ecd-ab4e-49da-a0d4-181b2ef13953
# ╠═c81cf58e-ee27-48ed-8b74-b69641b14477
# ╠═4ef5c76d-6fd4-45d3-92ae-09204c97bb92
# ╟─f5fdf62f-d6b9-4c8b-b115-aaef438ad0a7
# ╠═f5b9c790-9a00-4ce3-9ce7-21678dfdc7c3
# ╠═45241c71-8c6c-4e0b-9231-b744ccce080d
# ╠═add5e698-4911-4474-8587-054472dc5a93
# ╠═1b07883b-15ae-46ca-9129-e928e473e087
# ╠═393df60e-005f-4b42-888b-1d460570482f
# ╠═5003d44b-c0dd-4901-981b-b6be5b2e16f9
# ╟─1a26ba38-3598-4e41-acb1-9a8b38c506b3
# ╠═fa213a11-cbbd-40a2-a780-3f0a2fbf7ca4
# ╠═916610cc-555a-42b7-8033-ad79238b986f
# ╠═12c42a78-70b5-4422-8cd6-85069aaede0c
# ╠═fbcc6b8e-cc42-409a-a99d-0007c1e35434
# ╟─29772da5-16a2-4616-b82d-45b59a6904d0
# ╟─90d7fab6-b49c-467a-bf2b-50385ac3c1f8
# ╠═78803268-3036-460f-b379-b11cfa06eb8c
# ╠═82e006fe-0df9-4b1f-9a69-5106fc581e30
# ╠═841a6329-9438-4145-8974-ed09db9a7f08
# ╠═ba0cf5c6-a4ca-4c19-8408-aba3387e8041
# ╠═a443715d-ce7c-4f86-9982-c3d8db9c0d95
# ╠═5dcdef11-0a29-44fe-a91a-eae01dde0d24
# ╠═6b3ad624-ba42-4b75-9f01-6a066aa03668
# ╟─401d355e-cbf9-4ad4-a6f8-fe4d99bc9afe
# ╟─7f2f2ea2-3ba8-4b8b-80f0-2ce537d9b3d3
# ╠═6e9b9e74-1b1e-47aa-9f67-b5fdcf198d48
# ╟─25355210-a0f2-4df7-8144-8d5d10b3bb3c
# ╠═e18886ff-b1b1-4b22-988c-94eba958a9c8
# ╠═4cd8ff39-0252-4c50-a4a3-4658d3fecb37
# ╠═ab0c2eef-e56d-4e8b-9ba9-765001599794
# ╟─534e7c66-e3c8-483c-a527-38ec0bce8972
# ╠═c249e441-5a6a-4414-89d8-546832b97df4
# ╠═5a1463c0-f201-47c4-a131-cd51eca136f8
# ╟─7e4f4e5d-6b8b-4067-9402-c7905d006a2b
# ╠═a72f50bf-2319-4064-91e7-8e6075f00ecc
# ╟─d01eb8ee-f123-4d3b-916e-879204b6c1c6
# ╠═5337ed05-53d5-4733-b185-ec085ec8da13
# ╠═cad7655b-d3fa-466e-9d0a-595dd36d6b06
# ╟─b518d0e4-900c-40d0-8ecf-a727db10cba4
# ╠═eb365b91-4f93-4a38-bfa0-f7b1f9c7ba51
# ╠═c50f6d22-1a70-471d-a123-3e10c4e3f19d
# ╠═3fc622c1-fe5a-4c8f-a2d6-227c1a03d51f
# ╠═7692d93e-a562-4d8a-b139-05c9b0cc896c
# ╟─2280337a-e409-49fa-b9a3-872b3fd15f1a
# ╠═cbb433cd-6f8f-4133-b4bd-00b37d71c1e9
# ╠═e733b36f-7e45-41f3-94bd-efd9f91addc0
# ╟─999b22dc-740e-4a94-85e0-384e466db7ab
# ╠═cbab5c69-fdff-4fee-95f7-467ffbb56cc4
# ╠═d19244e0-ccec-4b95-b63f-c27bcd0a7771
# ╠═50ff754f-0ada-48df-99fc-c992adf8ce8b
# ╠═d3e58e15-5527-4013-8095-5c614040e51c
# ╠═37380c83-e73b-48ff-b95d-8fbd2453db4d
# ╠═f235fb6f-442b-48ee-918b-747f243f58ce
# ╠═883f2137-6c02-44fb-a273-fc06171d15ed
# ╠═89f7ae2b-345e-4374-b212-377d122b19c7
# ╟─c00aabaf-b3f7-4222-95ca-5f51a1104c18
# ╠═985466e9-95d2-4733-810d-8c3df45c95c7
# ╠═5f3982a7-9ac3-4610-a5a7-b4f7a7d66796
# ╟─d8d8ab10-c22e-4f59-9376-d65639827d20
# ╟─0a95875e-ffa2-4567-9582-9d727729a000
# ╠═fa49855f-e0c7-4b2b-a005-65852eeb1f4b
# ╟─58546405-7ca9-4221-a1eb-789030be36a9
# ╟─492fc49f-494b-443e-82b3-e31fa46545e5
# ╟─5c572632-aad4-48db-b098-31cc0f28d071
# ╟─65251f46-8cee-4503-81c3-768a92717d84
# ╠═6ff23055-5e2c-4d2a-a83d-533a5334e1ac
# ╠═c59a8420-3c1a-4a29-ab98-941cab80e526
# ╠═9a3e1264-93e4-4f97-be39-41c37bc4a4bc
# ╠═6779ce1e-8b5e-40b7-9285-05c83c08d95a
# ╟─8f91a4ba-aaa2-4b41-83ce-0b9520500d94
# ╠═0fa9e29a-9d9b-4882-b2f6-a3de01d0c833
# ╠═ce08a224-13f3-4660-bbe1-cf6e1005361c
# ╟─ffdf9c2f-cd41-42b1-a56c-91594440c6ba
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
