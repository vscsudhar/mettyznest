import 'package:flutter/material.dart';

class PetCardWidget extends StatelessWidget {
  String? petName;
  String? location;
  String? imageUrl;
  String? gender;
  final bool isFavorite;
  final VoidCallback? onTap;

  PetCardWidget({
    super.key,
    required this.petName,
    required this.location,
    required this.imageUrl,
    required this.gender,
    required this.isFavorite,
    required this.onTap,

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.white,
      elevation: 3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(90),
                      ),
                      child: Image.network(
                        imageUrl!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: InkWell(
                      onTap: onTap,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            isFavorite == true ? Icons.favorite :Icons.favorite_border,
                            color: isFavorite == true ? Colors.red : Colors.grey,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 5,
                      right: 5,
                      // top: 80,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(40), bottomLeft: Radius.zero), color: Colors.white),
                      )),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          (gender == 'Male')
                              ? Icons.male
                              : (gender == 'Female')
                                  ? Icons.female
                                  : Icons.transgender,
                          color: (gender == 'Male')
                              ? Colors.blue
                              : (gender == 'Female')
                                  ? Colors.pink
                                  : Colors.black,
                          size: 24,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 55,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      petName!,
                      style: const TextStyle(fontSize: 14, color: Color(0XFF262626), fontWeight: FontWeight.w600),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: Color(0XFF070707),
                          size: 15,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Expanded(
                          child: Text(
                            location!,
                            style: const TextStyle(fontSize: 13, color: Color(0XFF5C5E5D), overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
