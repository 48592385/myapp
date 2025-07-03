class Usuario {
  String name;
  String password;
  String direccion;
  int edad;

  Usuario(this.name, this.password, this.direccion, this.edad);
}

class Equiposeuropeos {
  String teamName;
  String teamImage;
  // Suggested code may be subject to a license. Learn more: ~LicenseLog:3329990825.
  String descripcion;

  Equiposeuropeos({required this.teamName, required this.teamImage, required this.descripcion});
}

List<Equiposeuropeos> teams = [
  Equiposeuropeos(
    teamName: 'Manchester City',
    teamImage:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnC6HvRIeI1V_4yORHsqRxHfDapeUqVwwStA&s',
    descripcion:
        'Club inglés fundado en 1880, conocido por su estilo de juego ofensivo y moderno bajo la dirección de Pep Guardiola. Ganador de múltiples títulos de la Premier League.',
  ),
  Equiposeuropeos(
    teamName: 'Barcelona',
    teamImage:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlxruvx7PqvE5IyW38HTP-jmVaUDDZK2hZdw&s',
    descripcion:
        'Fútbol Club Barcelona, conocido como "Barça", es uno de los clubes más grandes de España. Reconocido por su cantera y su filosofía de juego basada en la posesión.',
  ),
  Equiposeuropeos(
    teamName: 'Real Madrid',
    teamImage:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQU-PWdonXRK9AfwDqQlgzyjuLrrGXJZFM9RQ&s',
    descripcion:
        'Club más ganador de la Champions League. Con sede en Madrid, España, es uno de los equipos más exitosos y populares del mundo.',
  ),
  Equiposeuropeos(
    teamName: 'Bayern Munich',
    teamImage:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFxg_MHA46HjrmwIF7j-RU0ugKbTwEiqyUQg&s',
    descripcion:
        'Principal club de Alemania, dominador histórico de la Bundesliga. Conocido por su solidez táctica y su plantel de estrellas.',
  ),
  Equiposeuropeos(
    teamName: 'Borussia Dortmund',
    teamImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Borussia_Dortmund_logo.svg/800px-Borussia_Dortmund_logo.svg.png',
    descripcion:
        'Club alemán con una gran base de hinchas. Destacado por su cantera y por desarrollar jóvenes talentos. Su estadio, el Signal Iduna Park, es uno de los más icónicos.',
  ),
];