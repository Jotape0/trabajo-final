
install.packages("rvest")

library(rvest)

#abriendo pagina Imdb con las 250 mejores peliculas segun rating

imdbRating <- read_html("https://www.imdb.com/chart/top/?ref_=nv_mv_250")
print(html_text(imdbRating ))


#Sacando los titutlos del ranking de peliculas mejores puntuadas (se puede hacer con for igual)

imdbRating  <- read_html("https://www.imdb.com/chart/top/?ref_=nv_mv_250")
tituloPeliculas <- html_nodes(imdbRating , css=".titleColumn")
print(html_text2(tituloPeliculas[1:100]))



#utilizando for para sacar los titulos y sus links
for (nombreElemento in tituloPeliculas[1:100]) {
  print(html_text2(nombreElemento))
  print(html_attr(nombreElemento,"href"))
}


#extrayendo los links de cada pelicula

nombreElemento <- html_nodes(tituloPeliculas, css="a")
print(html_attr(nombreElemento[1],"href"))
link <- html_attr(nombreElemento[1:100],"href")
print(paste("imdb.com",link[1:100],sep = ""))
urlPelicula <- print(paste("imdb.com",link[1:100],sep = ""))
print(urlPelicula)

for

#calificaciones

calificacionPelicula <- html_nodes(imdbRating , css=".ratingColumn.imdbRating")
print(html_text2(calificacionPelicula))

#limpiando las puntuaciones de los usuarios de la pagina imbd

nroRatings <- html_nodes(imdbRating, css="strong")
nroRatings <- gsub("<strong title=","",nroRatings[1:100])
nroRatings <- gsub("</strong>","",nroRatings[1:100])
nroRatings <- gsub(">","",nroRatings[1:100])
nroRatings <- gsub("based on","",nroRatings[1:100])
print(nroRatings)


#creando el dataframe

misdatos <- data.frame()
titulos <- html_text2(tituloPeliculas[1:100])
calificacion <- html_text2(calificacionPelicula[1:100])
links <- print(paste("imdb.com",link[1:100],sep = ""))
nroRatings1 <- print(nroRatings[1:100])

tablaPeliculasPuntuadas <- data.frame(TITULOS=titulos, CALIFICACION=calificacion, LINKS=links)

write.csv2(tablaPeliculasPuntuadas,"PeliculasPuntuadass.csv")

#==================================================================================================================================================
#repitiendo el procedimiento, pero ahora sacando la informacion de las peliculas mas populares

#abriendo pagina IMDB de las 250 peliculas mas populares

imdbPopular <- read_html("https://www.imdb.com/chart/moviemeter?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=4da9d9a5-d299-43f2-9c53-f0efa18182cd&pf_rd_r=HCTS27J44EDTG8K8X65Z&pf_rd_s=right-4&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_ql_2")
print(html_text(imdbPopular))

#extrayendo los titulos de las peliculas populares

tituloPeliculasPopular <- html_nodes(imdbPopular , css=".titleColumn")
print(html_text2(tituloPeliculasPopular[1:100]))

#realizando el mismo procedeimiento anterior, pero utilizando For

for (peliculasPopular in tituloPeliculasPopular[1:100]) {
  print(html_text2(peliculasPopular))
}  

# sacando los links de cada pelicula popular

peliculasPopular <- html_nodes(tituloPeliculasPopular, css="a")
print(html_attr(peliculasPopular[1],"href"))
linkPopular <- html_attr(peliculasPopular[1:100],"href")
print(paste("imdb.com",linkPopular[1:100],sep =""))

#sacando las puntuaciones o rating de cada pelicula popular

calificacionPeliculaPopular <- html_nodes(imdbPopular,css=".ratingColumn.imdbRating")
print(html_text2(calificacionPeliculaPopular[1:100]))


#colocando NA a peliculas populares que aun no tienen puntuacion debido a reciente lanzamiento de las mismas.
for (calificacionPopular in calificacionPeliculaPopular[1:100]) {
  print(html_text2(calificacionPopular))
  calificacion2 <- html_text2(calificacionPopular)
  if (is.na(calificacionPopular)){
    print(calificacionPopular)
    
     }else{
   print("NA")
       
 }
}  


# realizando el data frame de peliculas populares

misdatos2 <- data.frame()
titulos2 <- html_text2(tituloPeliculasPopular[1:100])
calificacion2 <- html_text2(calificacionPeliculaPopular[1:100])
links2 <- print(paste("imdb.com",linkPopular[1:100],sep =""))

tablaPeliculasPopulares <- data.frame(TITULOS=titulos2, CALIFICACION=calificacion2, LINKS=links2)

write.csv2(tablaPeliculasPopulares,"PeliculasPopulares.csv")


