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

  Equiposeuropeos({required this.teamName, required this.teamImage});
}

List<Equiposeuropeos> teams = [
  Equiposeuropeos(
    teamName:'Manchester City',
    teamImage: ' https://upload.wikimedia.org/wikipedia/en/thumb/e/eb/Manchester_City_FC_badge.svg/800px-Manchester_City_FC_badge.svg.png'),
    Equiposeuropeos(teamName: 'Barcelona',
    teamImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlxruvx7PqvE5IyW38HTP-jmVaUDDZK2hZdw&s'),
    Equiposeuropeos(teamName: 'Real Madrid',
     teamImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQU-PWdonXRK9AfwDqQlgzyjuLrrGXJZFM9RQ&s'),
    Equiposeuropeos(teamName:  'Bayern Munich',
     teamImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFxg_MHA46HjrmwIF7j-RU0ugKbTwEiqyUQg&s'),
    Equiposeuropeos(teamName:'Borussia Dortmund' ,
    teamImage: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Borussia_Dortmund_logo.svg/800px-Borussia_Dortmund_logo.svg.png'),
  
];
