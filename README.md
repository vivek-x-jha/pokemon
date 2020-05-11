# Pokemon
Let's Play Pokemon!

For all my life, I have been fascinated with the global sensation that is the Pokemon franchise. Particularly, for the last 10 years, I have practiced and analyzed competitive battling.
 
The goal of this ongoing project is to gain some insights through EDA to help others make better battling decisions. Additionally, I build a classifier to that predicts whether a given pokemon is a **Legendary Pokemon**.

i.e. using the KPIs the game developers decided on, can we best classify between

| Legendary | Non - Legendary |
| :---: | :---: |
| <img src="images/mewtwo.png" width="150"/> | <img src="images/pikachu.png" width="150"/> |

# Source Data
Full Generations 1 - 7 dataset can be found on [Kaggle](https://www.kaggle.com/rounakbanik/pokemon).
But this dataset is slightly off. It was webscraped off [Serebii](https://www.serebii.net/pokedex-sm/), and I noticed any pokemon with "Mega Evolutions" (i.e. more powerful forms) had their data imputed on the original pokemon's data. 

To clean this and ensure that pokemon with Mega Evolutions were properly accounted for, I needed the original pokemons' data. I decided to use  [Gilles Armand's dataset](https://gist.github.com/armgilles/194bcff35001e7eb53a2a8b441e8b2c6) which had the following limitations:
1. Only contains Gen 1 - 6 data, but no pokemon from Gen 7 has a Mega form.
2. Important numeric features missing:
    * base_egg_steps
    * base_happiness
    * capture_rate
    * experience_growth
    * height_m
    * weight_kg

# Database Creation
Run the following command to initialize a `MySQL` database from the above source data:

`cat database_creation/*.sql | mysql --local-infile=1 -uroot -p`

After entering your root password, you should have the following db structure:
```
pokemon
|
|- pokestats
|   |
|   |- ad_pokestats (trigger)
|   |- ai_pokestats (trigger)
|   |- au_pokestats (trigger)
|
|- serebii
    |
    |- ad_serebii (trigger)
    |- ai_serebii (trigger)
    |- au_serebii (trigger)
```