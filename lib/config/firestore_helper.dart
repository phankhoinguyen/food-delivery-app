// final String jsonString = await rootBundle.loadString('assets/food.json');
//     final List<dynamic> jsonList = json.decode(jsonString);

//     // B2: Mapping sang Map<String, dynamic> & thêm các trường mặc định
//     final List<Map<String, dynamic>> foods =
//         (jsonList as List<dynamic>).map((item) {
//           final Map<String, dynamic> itemMap = Map<String, dynamic>.from(item);
//           return {...itemMap, 'id': '', 'kcal': 0, 'time': ''};
//         }).toList();

//     // B3: Lấy collection reference tới Firestore
//     final CollectionReference foodCollection = FirebaseFirestore.instance
//         .collection('products');

//     // B4: Upload từng document lên Firestore
//     for (var food in foods) {
//       try {
//         final docRef = await foodCollection.add(food); // tạo document
//         await docRef.update({'id': docRef.id}); // cập nhật id cho document đó
//         print('✅ Uploaded: ${food['name']} (ID: ${docRef.id})');
//       } catch (e) {
//         print('❌ Lỗi upload ${food['name']}: $e');
//       }
//     }


// Json

/* 
[
    {
        "imageCard": "assets/food-delivery/product/beef_burger.png",
        "imageDetail": "assets/food-delivery/product/beef_burger1.png",
        "name": "Beef Burger",
        "price": 7.59,
        "rate": 4.5,
        "specialItems": "Cheesy Mozarella 🧀",
        "category": "Burger"
    },
    {
        "imageCard": "assets/food-delivery/product/double_burger.png",
        "imageDetail": "assets/food-delivery/product/double_burger1.png",
        "name": "Double Burger",
        "price": 10,
        "rate": 4.9,
        "specialItems": "Double Beef 🍖",
        "category": "Burger"
    },
    {
        "imageCard": "assets/food-delivery/product/cheese-burger.png",
        "imageDetail": "assets/food-delivery/product/cheese-burger1.png",
        "name": "Cheese Burger",
        "price": 8.88,
        "rate": 4.8,
        "specialItems": "Extra Cheese 🧀",
        "category": "Burger"
    },
    {
        "imageCard": "assets/food-delivery/product/bacon_burger.png",
        "imageDetail": "assets/food-delivery/product/bacon_burger1.png",
        "name": "Bacon Burger",
        "price": 9.99,
        "rate": 5,
        "specialItems": "Mix Beef 🥩",
        "category": "Burger"
    },
    {
        "imageCard": "assets/food-delivery/product/pizza111.png",
        "imageDetail": "assets/food-delivery/product/pizza.png",
        "name": "Chicken Pizza",
        "price": 19.99,
        "rate": 4,
        "specialItems": "Cheese Pizza 🍕",
        "category": "Pizza"
    },
    {
        "imageCard": "assets/food-delivery/product/cup_cake.png",
        "imageDetail": "assets/food-delivery/product/cup-cake1.png",
        "name": "Cream Cake",
        "price": 5.99,
        "rate": 4.7,
        "specialItems": "Mix Cream 🧁",
        "category": "Cup Cake"
    }
]
*/