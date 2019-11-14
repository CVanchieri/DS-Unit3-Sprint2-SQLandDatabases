/*1.How many total Characters are there? #302*/
SELECT character_id, name 
FROM charactercreator_character
ORDER BY character_id DESC
/*2.How many of each specific subclass?*/
/*cleric. #240*/
SELECT character_ptr_id
FROM charactercreator_cleric
ORDER BY character_ptr_id DESC
/*fighter. #68*/
SELECT character_ptr_id
FROM charactercreator_fighter
ORDER BY character_ptr_id DESC
/*mage. #302*/
SELECT character_ptr_id
FROM charactercreator_mage
ORDER BY character_ptr_id DESC
/*necromancer. #302*/
SELECT mage_ptr_id
FROM charactercreator_necromancer
ORDER BY mage_ptr_id DESC
/*thief. #291*/
SELECT character_ptr_id
FROM charactercreator_thief
ORDER BY character_ptr_id DESC
/*3.How many total Items? #174*/
SELECT item_id, name
FROM armory_item 
ORDER BY item_id DESC
/*4.How many of the Items are weapons? #174 How many are not? #0*/
SELECT item_ptr_id
FROM armory_weapon 
ORDER BY item_ptr_id DESC
/*5.How many Items does each character have? (Return first 20 rows)*/
SELECT character_id, item_id
FROM charactercreator_character_inventory
ORDER BY character_id DESC
LIMIT 20

/*6.How many Weapons does each character have? (Return first 20 rows)*/

/*7.On average, how many Items does each Character have?*/

/*8.On average, how many Weapons does each character have?*/