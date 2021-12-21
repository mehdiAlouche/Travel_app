class Travel {
  String name;
  String location;
  String url;

  Travel(this.name, this.location, this.url);
  static List<Travel> generateTravelBlog() {
    return [
      Travel('place1', 'location 1', 'assets/img/sahara.jpg'),
      Travel('place2', 'location 2', 'assets/img/marrakech.jpg'),
      Travel('place3', 'location 3', 'assets/img/ourzazat.jpg'),
    ];
  }

  static List<Travel> generateMostPopularlBlog() {
    return [
      Travel('place1', 'location 1', 'assets/img/sahara.jpg'),
      Travel('place2', 'location 2', 'assets/img/marrakech.jpg'),
      Travel('place3', 'location 3', 'assets/img/ourzazat.jpg'),
    ];
  }
}
