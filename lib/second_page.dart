import 'package:flutter/material.dart';


class CountryPage extends StatefulWidget {
  const CountryPage({super.key});

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  final List<Map<String, String>> allCountries = const [
  {'name': 'Afghanistan', 'code': 'af'},
  {'name': 'Albania', 'code': 'al'},
  {'name': 'Algeria', 'code': 'dz'},
  {'name': 'Andorra', 'code': 'ad'},
  {'name': 'Angola', 'code': 'ao'},
  {'name': 'Argentina', 'code': 'ar'},
  {'name': 'Armenia', 'code': 'am'},
  {'name': 'Australia', 'code': 'au'},
  {'name': 'Austria', 'code': 'at'},
  {'name': 'Azerbaijan', 'code': 'az'},
  {'name': 'Bahrain', 'code': 'bh'},
  {'name': 'Bangladesh', 'code': 'bd'},
  {'name': 'Belarus', 'code': 'by'},
  {'name': 'Belgium', 'code': 'be'},
  {'name': 'Bolivia', 'code': 'bo'},
  {'name': 'Brazil', 'code': 'br'},
  {'name': 'Bulgaria', 'code': 'bg'},
  {'name': 'Canada', 'code': 'ca'},
  {'name': 'Chile', 'code': 'cl'},
  {'name': 'China', 'code': 'cn'},
  {'name': 'Colombia', 'code': 'co'},
  {'name': 'Croatia', 'code': 'hr'},
  {'name': 'Cuba', 'code': 'cu'},
  {'name': 'Cyprus', 'code': 'cy'},
  {'name': 'Czech Republic', 'code': 'cz'},
  {'name': 'Denmark', 'code': 'dk'},
  {'name': 'Dominican Republic', 'code': 'do'},
  {'name': 'Egypt', 'code': 'eg'},
  {'name': 'Finland', 'code': 'fi'},
  {'name': 'France', 'code': 'fr'},
  {'name': 'Germany', 'code': 'de'},
  {'name': 'Greece', 'code': 'gr'},
  {'name': 'Hungary', 'code': 'hu'},
  {'name': 'India', 'code': 'in'},
  {'name': 'Indonesia', 'code': 'id'},
  {'name': 'Iran', 'code': 'ir'},
  {'name': 'Iraq', 'code': 'iq'},
  {'name': 'Ireland', 'code': 'ie'},
  {'name': 'Italy', 'code': 'it'},
  {'name': 'Japan', 'code': 'jp'},
  {'name': 'Jordan', 'code': 'jo'},
  {'name': 'Kazakhstan', 'code': 'kz'},
  {'name': 'Kenya', 'code': 'ke'},
  {'name': 'Kuwait', 'code': 'kw'},
  {'name': 'Lebanon', 'code': 'lb'},
  {'name': 'Libya', 'code': 'ly'},
  {'name': 'Malaysia', 'code': 'my'},
  {'name': 'Mexico', 'code': 'mx'},
  {'name': 'Morocco', 'code': 'ma'},
  {'name': 'Netherlands', 'code': 'nl'},
  {'name': 'New Zealand', 'code': 'nz'},
  {'name': 'Nigeria', 'code': 'ng'},
  {'name': 'North Korea', 'code': 'kp'},
  {'name': 'Norway', 'code': 'no'},
  {'name': 'Oman', 'code': 'om'},
  {'name': 'Pakistan', 'code': 'pk'},
  {'name': 'Palestine', 'code': 'ps'},
  {'name': 'Peru', 'code': 'pe'},
  {'name': 'Philippines', 'code': 'ph'},
  {'name': 'Poland', 'code': 'pl'},
  {'name': 'Portugal', 'code': 'pt'},
  {'name': 'Qatar', 'code': 'qa'},
  {'name': 'Romania', 'code': 'ro'},
  {'name': 'Russia', 'code': 'ru'},
  {'name': 'Saudi Arabia', 'code': 'sa'},
  {'name': 'Serbia', 'code': 'rs'},
  {'name': 'Singapore', 'code': 'sg'},
  {'name': 'Slovakia', 'code': 'sk'},
  {'name': 'Slovenia', 'code': 'si'},
  {'name': 'South Africa', 'code': 'za'},
  {'name': 'South Korea', 'code': 'kr'},
  {'name': 'Spain', 'code': 'es'},
  {'name': 'Sudan', 'code': 'sd'},
  {'name': 'Sweden', 'code': 'se'},
  {'name': 'Switzerland', 'code': 'ch'},
  {'name': 'Syria', 'code': 'sy'},
  {'name': 'Thailand', 'code': 'th'},
  {'name': 'Tunisia', 'code': 'tn'},
  {'name': 'Turkey', 'code': 'tr'},
  {'name': 'Ukraine', 'code': 'ua'},
  {'name': 'United Arab Emirates', 'code': 'ae'},
  {'name': 'United Kingdom', 'code': 'gb'},
  {'name': 'United States', 'code': 'us'},
  {'name': 'Venezuela', 'code': 've'},
  {'name': 'Vietnam', 'code': 'vn'},
  {'name': 'Yemen', 'code': 'ye'},
  ];

  List<Map<String, String>> filteredCountries = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    filteredCountries = allCountries;
  }

  void updateSearch(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      filteredCountries = allCountries
          .where((country) =>
              country['name']!.toLowerCase().contains(searchQuery))
          .toList();
    });
  }

  String getFlagUrl(String code) {
    return 'https://flagcdn.com/w80/$code.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Your Country')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search country...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: updateSearch,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCountries.length,
              itemBuilder: (context, index) {
                final country = filteredCountries[index];
                return ListTile(
                  leading: Image.network(
                    getFlagUrl(country['code']!),
                    width: 48,
                    height: 32,
                    fit: BoxFit.cover,
                  ),
                  title: Text(country['name']!),
                  onTap: () {
                    Navigator.pop(context, country['name']);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
