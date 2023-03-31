import 'package:flutter/material.dart';
import '../../flutter_flow/flutter_flow_theme.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    const Padding(
    padding: EdgeInsets.all(8.0),
    child: Text(
    'News',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30.0,
    ),
    ),
    ),
    Expanded(
    child: ListView(
        children: [
          _buildArticle(
            'Conseils pour mieux dormir la nuit',
            'https://example.com/articles/sommeil/conseils-bien-dormir',
            'Dormir suffisamment est important pour notre santé et notre bien-être. Voici quelques conseils pour améliorer la qualité de votre sommeil la nuit.',

          ),
          _buildArticle(
            'Les effets du manque de sommeil sur la santé',
            'https://example.com/articles/sommeil/effets-manque-sommeil',
            'Le manque de sommeil peut avoir de graves conséquences sur notre santé physique et mentale. Découvrez les effets du manque de sommeil et comment y remédier.',

          ),
          _buildArticle(
            'Les différents cycles de sommeil',
            'https://example.com/articles/sommeil/cycles-sommeil',
            'Le sommeil est un processus complexe qui se compose de différents cycles. Découvrez les différents stades du sommeil et leur importance pour notre récupération.',

          ),
          _buildArticle(
            'Les bienfaits d\'une sieste régulière',
            'https://example.com/articles/sommeil/bienfaits-sieste',
            'Prendre une sieste peut être bénéfique pour votre productivité, votre créativité et votre santé mentale. Découvrez les bienfaits d\'une sieste régulière.',

          ),
          _buildArticle(
            'Comment créer un rituel du coucher apaisant',
            'https://example.com/articles/sommeil/rituel-coucher',
            'Créer un rituel du coucher apaisant peut vous aider à vous endormir plus facilement et à améliorer la qualité de votre sommeil. Voici quelques astuces pour créer votre propre rituel.',

          ),
          _buildArticle(
            'Les dangers des somnifères',
            'https://example.com/articles/sommeil/dangers-somniferes',
            'Les somnifères peuvent sembler être une solution rapide pour lutter contre l\'insomnie, mais ils peuvent avoir de graves effets secondaires et être très addictifs. Découvrez les dangers des somnifères.',
            
          ),

        ],
      ),
    ),
    ],
    );
  }

  Widget _buildArticle(String title, String url, String description) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            child: Text('Lire l\'article'),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}