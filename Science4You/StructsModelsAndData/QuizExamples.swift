//
//  QuizExamples.swift
//  Science4You
//
//  Created by apprenant83 on 26/10/2022.
//

import Foundation

//  ----------------------------------------------------------------------------------------------------
//  Exemples de quiz codés en dur (statiques) en attendant les échanges avec une base de données externe
//  ----------------------------------------------------------------------------------------------------

//  Exemple 1 [sciences de la terre]

var a1_1 = Answer(proposition: "il y a 46 milliards d’années", isTrue: false)
var a1_2 = Answer(proposition: "il y a 4,6 milliards d’années", isTrue: true)
var a1_3 = Answer(proposition: "il y a 460 millions d’années", isTrue: false)
var a1_4 = Answer(proposition: "il y a 46 millions d’années", isTrue: false)
var q1 = Question(content: "Quand la Terre s’est-elle formée ?", answersArray: [a1_1, a1_2, a1_3, a1_4], explanation: "")

var a2_1 = Answer(proposition: "l'eau", isTrue: true)
var a2_2 = Answer(proposition: "l’oxygène", isTrue: false)
var a2_3 = Answer(proposition: "le dioxyde de carbone", isTrue: true)
var a2_4 = Answer(proposition: "le diazote", isTrue: false)
var q2 = Question(content: "Quels sont les principaux gaz qui composaient l’atmosphère primitive ?", answersArray: [a2_1, a2_2, a2_3, a2_4], explanation: """
Peu de temps après la formation de la Terre, l’atmosphère primitive s'est formée par dégazage de sa surface en fusion. Il y a 4,4 à 4 milliards d’années, l’atmosphère primitive était composée essentiellement d’eau (H2O pour 85%), avec une quantité importante de dioxyde de carbone (CO2 pour 10 à 15%) et d’un peu de diazote (N2 pour 1 à 3 %). Elle était impropre à la vie.
""")

var a3_1 = Answer(proposition: "l'eau", isTrue: false)
var a3_2 = Answer(proposition: "l’oxygène", isTrue: true)
var a3_3 = Answer(proposition: "le dioxyde de carbone", isTrue: false)
var a3_4 = Answer(proposition: "le diazote", isTrue: true)
var q3 = Question(content: "Quels sont les deux gaz présents en plus grandes quantités dans l’atmosphère actuelle ?", answersArray: [a3_1, a3_2, a3_3, a3_4], explanation: """
L'hydrosphère terrestre a une double origine: cosmique (apport d'eau par les météorites et les comètes) et dégazage de la vapeur d'eau par le manteau primitif. Cette vapeur s'est ensuite condensée à cause du refroidissement de la surface terrestre et de l'atmosphère, formant ainsi des océans d'eau liquide (on estime qu'il a fallu environ 150 millions d'années pour les former).

L'émergence de la vie dans les océans, il y a 3,5 milliards d'années, a permis l'apparition du dioxygène dans l'atmosphère grâce à des organismes photosynthétiques: les cyanobactéries. À partir de 2,4 milliards d'années, l'atmosphère s'est enrichie en dioxygène grâce aux échanges entre l'océan et l'atmosphère. La teneur en diazote a augmenté.

La Terre est entourée aujourd’hui d’une atmosphère composée de 78 % de diazote (N2), de 21 % de dioxygène (O2), de 0,03 % de CO2 et de quantités variables de vapeur d’eau.
""")

var a4_1 = Answer(proposition: "solide", isTrue: true)
var a4_2 = Answer(proposition: "liquide", isTrue: true)
var a4_3 = Answer(proposition: "gazeuse", isTrue: true)
var a4_4 = Answer(proposition: "autre", isTrue: false)
var q4 = Question(content: "Sous quelles formes se présente l’hydrosphère ?", answersArray: [a4_1, a4_2, a4_3, a4_4], explanation: """
Plus de 70% de la surface terrestre est couverte d'eau; l’hydrosphère désigne l'ensemble de l'eau présente sur la Terre.

On la trouve donc sous forme de vapeur d'eau dans l'atmosphère (gazeuse), sous forme de cristaux de glace dans les glaciers, la banquise et la neige (solide) et sous forme liquide dans les océans, les mers, les lacs, les cours d'eau, les nappes d'eau souterraines, les gouttes de pluie...
""")

var a5_1 = Answer(proposition: "", isTrue: true)
var a5_2 = Answer(proposition: "", isTrue: false)
var a5_3 = Answer(proposition: "", isTrue: false)
var a5_4 = Answer(proposition: "", isTrue: false)
var q5 = Question(content: "", answersArray: [a5_1, a5_2, a5_3, a5_4], explanation: "")

var a6_1 = Answer(proposition: "", isTrue: true)
var a6_2 = Answer(proposition: "", isTrue: false)
var a6_3 = Answer(proposition: "", isTrue: false)
var a6_4 = Answer(proposition: "", isTrue: false)
var q6 = Question(content: "", answersArray: [a6_1, a6_2, a6_3, a6_4], explanation: "")

let image: String = "https://www.geographyrealm.com/wp-content/uploads/2020/03/geosphere-biosphere-earth.png"

var svtQuiz = Quiz(title: "De l’atmosphère primitive à l’hydrosphère", image: "local_svt", theme: "svt", level: 1, questionsArray: [q1, q2, q3, q4])

//  Exemple 2 [mathématiques]:

let at1Quiz = Quiz(title: "Alan Turing, père fondateur de l'informatique [débutant]", image: "local_enigma", theme: "math", level: 1, withString: string1)
let at2Quiz = Quiz(title: "Alan Turing, père fondateur de l'informatique [confirmé]", image: "local_enigma", theme: "math", level: 3, withString: string2)
let at3Quiz = Quiz(title: "Alan Turing, père fondateur de l'informatique [expert]", image: "local_enigma", theme: "math", level: 5, withString: string3)

let string1 = """
***Q***
Quelle machine Alan Turing a-t-il cryptanalysé durant la Seconde Guerre mondiale ?
***TA***
Enigma
***FA***
ENIAC
***FA***
Deep Blue
***FA***
Delilah
***E***
Enigma est une machine électromécanique portable servant au chiffrement et au déchiffrement de l'information.
***Q***
Quelle expérience de pensée Alan Turing a-t-il présenté en 1936 ?
***TA***
Machine de Turing
***FA***
Arcades de Turing
***FA***
Cercle de Turing
***FA***
Parade de Turing
***E***
Ces expériences de pensée prendront tout leur sens avec la diffusion des ordinateurs, dans la seconde moitié du XXe siècle.
***Q***
Qu'a-t-on retrouvé sur la table de nuit de Turing le jour de sa mort ?
***TA***
Pomme
***FA***
Cadran
***FA***
Clé
***FA***
Manuscrit
***E***
L'autopsie du corps conclut à un suicide par empoisonnement au cyanure, même si sa mère tenta d'écarter cette thèse.
***Q***
Quel programme Turing a-t-il écrit en mai 1952 pour réaliser son célèbre test ?
***TA***
Jeu d'échecs
***FA***
OXO
***FA***
Jeu de l'oie
***FA***
Dames
***E***
Ne disposant pas d'un ordinateur assez puissant pour l'exécuter, Alan Turing a simulé les calculs de la machine.
***Q***
Des travaux de quel physicien Alan Turing s'est-il inspiré en 1928 ?
***TA***
Albert Einstein
***FA***
Werner Heisenberg
***FA***
Lev Landau
***FA***
Arthur Compton
***E***
Les travaux d'Einstein remettaient en cause les axiomes d'Euclide et les lois de la mécanique céleste de Galilée et Newton.
***Q***
Dans quel système informatique l'algorithme de chiffrement d'Enigma a été implémenté ?
***TA***
UNIX
***FA***
Windows
***FA***
Android
***FA***
Mac OS
***E***
Cette commande intégrée a été utilisée par des laboratoires civils et militaires qui croyaient protéger ainsi leurs communications.
***Q***
Lequel de ces éléments ne fait pas partie de la machine de Turing ?
***TA***
Alimentation externe
***FA***
Ruban infini
***FA***
Registre d'état
***FA***
Table d'actions
***E***
Quoique son nom de machine puisse conduire à croire le contraire, une machine de Turing est un concept abstrait.
***Q***
Quelle machine électromécanique fut inventée par l'Allemand Arthur Scherbius ?
***TA***
Enigma
***FA***
Deep Blue
***FA***
Colossus
***FA***
ACE
***E***
Enigma fut utilisée principalement par les Allemands (Die Chiffriermaschine Enigma) pendant la Seconde Guerre mondiale.
***Q***
Lequel de ces langages informatiques n'est pas Turing-complet ?
***TA***
SQL
***FA***
Java
***FA***
Python
***FA***
C
***E***
Un langage est dit Turing-complet s'il permet de représenter toutes les fonctions calculables au sens de Turing et Church.
***Q***
Quel supercalculateur fut le premier à battre un champion du monde d'échecs ?
***TA***
Deep Blue
***FA***
Sequoia
***FA***
Myrinet
***FA***
GENCI
***E***
L'Intelligence Artificielle démarre dans les années 1950 avec les travaux d'Alan Turing, qui se demande si une machine peut penser.
"""

let string2 = """
***Q***
Qu'est censée imiter une machine faisant le test de Turing ?
***TA***
Conversation
***FA***
Dessin
***FA***
Mouvement
***FA***
Silhouette
***E***
Le test de Turing est une proposition de test d'IA fondée sur la faculté d'une machine à imiter la conversation humaine.
***Q***
Quelle thèse de Turing concerne la définition de la notion de calculabilité ?
***TA***
Thèse de Church
***FA***
Thèse de Danz
***FA***
Thèse de Muray
***FA***
Thèse de Schwartz
***E***
Dans sa forme physique, elle affirme que la notion physique de la calculabilité est exprimée par un ensemble de règles de calcul.
***Q***
Pour quelle raison Alan Turing a-t-il été poursuivi en justice en 1952 ?
***TA***
Son homosexualité
***FA***
Sa religion
***FA***
Son argent
***FA***
Son savoir
***E***
Pour éviter la prison suite à un fait divers lié à son homosexualité, Alan Turing a choisi la castration chimique par prise d'oestrogènes.
***Q***
Comment Alan Turing a-t-il été retrouvé mort dans sa maison de Manchester ?
***TA***
Empoisonné
***FA***
Décapité
***FA***
Pendu
***FA***
Poignardé
***E***
En 1954, à l'Ã¢ge de seulement 41 ans, Alan Turing a été retrouvé dans sa chambre, mort d'un empoisonnement au cyanure.
***Q***
Quel franco-américain a réalisé en 1982 le film franco-britannique « Enigma » ?
***TA***
Jeannot Szwarc
***FA***
Alexandre Aja
***FA***
Didier Caron
***FA***
Olias Barco
***E***
Le film « Enigma » propose une belle affiche avec, entre autres, Martin Sheen, Brigitte Fossey, Sam Neill et Michael Lonsdale.
***Q***
Qui a publié le roman « Indécence manifeste » sur la vie de Turing ?
***TA***
David Lagercrantz
***FA***
Ulf Durling
***FA***
Patrick Boman
***FA***
Björn Larsson
***E***
Lagercrantz est connu pour avoir écrit une biographie de Zlatan Ibrahimovic ainsi que le roman policier « Ce qui ne me tue pas ».
***Q***
Dans quelle ville Alan Turing est-il né le 23 juin 1912 ?
***TA***
Londres
***FA***
Sydney
***FA***
Stockholm
***FA***
Bruxelles
***E***
Il est né du fonctionnaire d'administration coloniale Julius Mathison Turing et de sa femme Ethel Sarah Turing (née Stoney).
***Q***
Très jeune, en combien de temps Alan Turing a-t-il appris seul à lire ?
***TA***
3 semaines
***FA***
6 jours
***FA***
2 mois
***FA***
1 an
***E***
Très tÃ´t, le jeune Turing montra les signes de son génie ainsi qu'une affinité précoce pour les chiffres et la résolution d'énigmes.
***Q***
Dans quel site de décryptage du Royaume-Uni Turing et Knox ont-ils travaillé ?
***TA***
Bletchley Park
***FA***
Thankful Village
***FA***
Warship Camp
***FA***
Base 23
***E***
Bletchley Park y hébergeait pendant la Seconde Guerre mondiale une station secrète d'interception radio et une station d'émission.
***Q***
À quel bâtiment préfabriqué Turing a-t-il été affecté pour l'Enigma navale ?
***TA***
Hut 8
***FA***
Fox 34
***FA***
Delta 6
***FA***
Zone 51
***E***
Alan Turing dira : « J'ai traité ce problème parce que personne d'autre ne s'en occupait et que je pouvais l'avoir pour moi seul ».
"""

let string3 = """
***Q***
Depuis quelle année le prix Turing est-il annuellement décerné ?
***TA***
1966
***FA***
1976
***FA***
1986
***FA***
1996
***E***
Le prix est décerné à des personnes ayant apporté une contribution scientifique significative au domaine de la recherche informatique.
***Q***
Quel était le prix approximatif (en euros) de l'Enigma-A, sorti en 1923 ?
***TA***
30 000 euros
***FA***
50 000 euros
***FA***
70 000 euros
***FA***
90 000 euros
***E***
C'est finalement l'Enigma-D qui deviendra le modèle le plus répandu après son adoption par la Marine allemande en 1926.
***Q***
Quelle machine à coder la voix a été réalisée par Alan Turing ?
***TA***
Delilah
***FA***
Enigma
***FA***
Kaneda
***FA***
Frontera
***E***
Turing a découvert en 1943 les progrès des technologies électroniques en partant en mission de cryptanalyste.
***Q***
À quels modèles Alan Turing va-t-il s'intéresser à la fin de sa vie ?
***TA***
Morphogenèse
***FA***
Thermogenèse
***FA***
Endurogenèse
***FA***
Biogenèse
***E***
La morphogenèse est l'ensemble des lois qui déterminent la forme et la structure des tissus, des organes et des organismes.
***Q***
En quelle année la reine Élisabeth II a-t-elle gracié Turing à titre posthume ?
***TA***
2013
***FA***
1983
***FA***
1993
***FA***
2003
***E***
Suite au déchiffrage de la machine Enigma, Alan Turing ne sera reconnu comme héros de guerre que 55 ans après sa mort.
***Q***
Combien de pages contient le manuscrit de Turing vendu en 2015 ?
***TA***
56
***FA***
132
***FA***
247
***FA***
398
***E***
Alan Turing avait légué ses papiers comprenant des réflexions sur la notation de Leibniz au mathématicien Robin Gandy.
***Q***
Quel mathématicien de Cambridge a aidé à améliorer la bombe de Turing ?
***TA***
Gordon Welchman
***FA***
Harry Hinsley
***FA***
John Herivel
***FA***
Hugh Foss
***E***
Une fois fabriquée, la bombe devint l'outil fondamental le plus automatisé de l'attaque des messages chiffrés par Enigma.
***Q***
Quel est le premier projet détaillé d'un ordinateur réalisé par Turing ?
***TA***
ACE
***FA***
KDE
***FA***
RAR
***FA***
PGA
***E***
Turing ne parviendra toutefois pas à s'entendre avec les ingénieurs électroniciens du NPL chargés de construire cette machine.
***Q***
Quelle machine a contribué à orienter Turing vers la conception d'un ordinateur ?
***TA***
Colossus
***FA***
Mastodonth
***FA***
Gigantic
***FA***
Megalox
***E***
Construit en onze mois, Colossus était constitué de 1 500 puis 2 400 tubes à vide et réalisait 5 000 opérations par seconde.
***Q***
Qui fut directeur de la Hut 8 en l'absence d'Alan Turing ?
***TA***
Hugh Alexander
***FA***
Stuart Conquest
***FA***
William Potter
***FA***
Raymond Keene
***E***
Après la Seconde Guerre mondiale, Hugh Alexander fut pendant vingt ans le chef de la section H (cryptanalyse) du GCHQ.
"""

//  Exemple 3 [médecine]:

let scvQuiz = Quiz(title: "Le système cardiovasculaire", image: "local_scv", theme: "med", level: 1, withString: string4)

let string4 = """
***Q***
Les veines acheminent le sang vers les organes.
***TA***
FAUX
***FA***
VRAI
***E***
Les veines envoient le sang vers le cœur. Ce sont les artères qui le conduisent vers les organes. Ces dernières sont plus élastiques que les veines, et la pression y est plus importante.
***Q***
La rate élimine les globules rouges déficients.
***TA***
VRAI
***FA***
FAUX
***E***
L’organe joue un rôle dans la purification du sang. La rate emmagasine également les plaquettes.
***Q***
L’aorte d’un adulte en bonne santé mesure au moins 5 cm de diamètre.
***TA***
FAUX
***FA***
VRAI
***E***
L’aorte a généralement de 2 à 2,5 cm de diamètre. Une mesure qui dépasse les 3 cm peut constituer un signe d’anévrisme de l’aorte abdominale.
***Q***
Les vaisseaux sanguins d’un adulte mesurent environ 100 000 km de longueur.
***TA***
VRAI
***FA***
FAUX
***E***
Si on les mettait bout à bout, les vaisseaux sanguins d’une personne adulte permettraient de faire deux fois et demie le tour de la Terre.
***Q***
Chaque minute, le foie filtre les cinq litres de sang contenus dans le corps humain.
***TA***
FAUX
***FA***
VRAI
***E***
Le foie filtre environ 1,7 litre de sang par minute. Il renferme quelque 13 % du sang qui circule dans l’organisme.
***Q***
Les plaquettes sont fabriquées dans la moelle osseuse « jaune ».
***TA***
FAUX
***FA***
VRAI
***E***
La moelle osseuse « jaune » a comme fonction de stocker le tissu graisseux. Les globules rouges, la majorité des globules blancs et les plaquettes sont produits dans la moelle osseuse « rouge ».
***Q***
L’artère pulmonaire achemine aux poumons le sang riche en dioxyde de carbone depuis le ventricule droit du cœur.
***TA***
VRAI
***FA***
FAUX
***E***
Les poumons transfèrent dans le sang l’oxygène contenu dans l'air et en expulsent le dioxyde de carbone.
***Q***
La péricardite consiste en une inflammation de la membrane externe du cœur.
***TA***
VRAI
***FA***
FAUX
***E***
La péricardite peut notamment être causée par une bactérie ou un virus. Elle engendre généralement des difficultés respiratoires.
***Q***
L’angine de poitrine (angor) survient lorsque le cœur reçoit une trop grande quantité de sang non oxygéné.
***TA***
FAUX
***FA***
VRAI
***E***
L’angine de poitrine se produit quand le cœur ne reçoit pas suffisamment de sang oxygéné à cause du durcissement des artères. Le symptôme le plus connu est une sensation de serrement dans la poitrine.
***Q***
Le cœur compte deux oreillettes : la haute et la basse.
***TA***
FAUX
***FA***
VRAI
***E***
Le cœur se compose des oreillettes droite et gauche, deux cavités. Le sang désoxygéné passe par la première, tandis que le sang oxygéné circule par la seconde.
***Q***
Les thromboses peuvent avoir lieu à la fois dans les veines et dans les artères.
***TA***
VRAI
***FA***
FAUX
***E***
On qualifie d’artérielle une thrombose qui se forme dans les artères et de veineuse une thrombose qui naît dans une veine. Toutes deux peuvent causer le blocage d’un vaisseau sanguin.
***Q***
Les sons provenant du battement du cœur sont produits par la fermeture répétée des valvules.
***TA***
VRAI
***FA***
FAUX
***E***
L’organe est doté de quatre valvules, qui se situent à différents endroits sur le cœur.
***Q***
Chez un adulte en bonne santé, le cœur bat environ 100 000 fois par jour.
***TA***
VRAI
***FA***
FAUX
***E***
Un nombre de battements plus bas ou plus élevé peut indiquer la présence d’une pathologie comme une bradycardie ou une tachycardie.
***Q***
Les artères musculaires se composent d’une grande quantité de tissus élastiques.
***TA***
FAUX
***FA***
VRAI
***E***
Ce sont les artères élastiques qui renferment une importante quantité de ces tissus. Les artères musculaires, elles, contiennent plus de muscles lisses et jouent un rôle majeur dans les processus de vasoconstriction.
"""
