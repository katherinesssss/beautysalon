class Procedure {
  final int id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  Procedure({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}
final Map<String, List<Procedure>> proceduresByCategory = {
  'SPA': [
    Procedure(
        id: 1,
        title: 'Detox Body Wrap',
        description: 'A wrap with detoxifying ingredients to cleanse the skin.',
        price: 25.99,
        imageUrl: 'lib/assets/picture/bodywrap.jpg'),
    Procedure(
        id: 12,
        title: 'Body Scrub',
        description: 'Exfoliation with salt, sugar, or coffee to remove dead skin and soften the body.',
        price: 23.49,
        imageUrl: 'lib/assets/picture/scrub.jpg'),
    Procedure(
        id: 13,
        title: 'Cryotherapy',
        description: 'Short exposure to extreme cold to reduce inflammation and boost energy.',
        price: 55.99,
        imageUrl: 'lib/assets/picture/cryotherapy.jpg'),
    Procedure(
        id: 14,
        title: 'Steam Room Session',
        description: 'Heat therapy to detoxify, relax muscles, and improve circulation.',
        price: 37.99,
        imageUrl: 'lib/assets/picture/SteamRoomSession.jpg'),
    Procedure(
        id: 15,
        title: 'Crystal Sound Bath Therapy',
        description: 'Lie back as quartz singing bowls emit soothing frequencies, releasing stress and balancing energy.',
        price: 28.99,
        imageUrl: 'lib/assets/picture/CrystalSoundBathTherapy.jpg'),
  ],
  'MASSAGE': [
    Procedure(
        id: 2,
        title: 'Swedish Massage',
        description: 'Uses long strokes, kneading, and circular movements to ease muscle tension and improve circulation.',
        price: 10.99,
        imageUrl: 'lib/assets/picture/SwedishMassage.jpg'),
    Procedure(
        id: 21,
        title: 'Deep Tissue Massage',
        description: 'Focuses on deeper muscle layers and connective tissue to relieve severe knots and stiffness.',
        price: 14.99,
        imageUrl: 'lib/assets/picture/DeepTissueMassage.webp'),
    Procedure(
        id: 22,
        title: 'Hot Stone Massage',
        description: 'Incorporates heated basalt stones placed on key points to melt away tension and enhance blood flow.',
        price: 22.99,
        imageUrl: 'lib/assets/picture/HotStoneMassage.webp'),
    Procedure(
        id: 23,
        title: 'Aromatherapy Massage',
        description: 'Custom-blended oils (like lavender or eucalyptus) boost relaxation, mood, and skin health during the massage.',
        price: 12.99,
        imageUrl: 'lib/assets/picture/oilmassage.webp'),
    Procedure(
        id: 24,
        title: 'Sports Massage',
        description: 'Focuses on preventing/treating injuries, improving flexibility, and enhancing athletic performance through targeted techniques.',
        price: 16.99,
        imageUrl: 'lib/assets/picture/SportsMassage.jpg'),
  ],
  'SKIN':[
    Procedure(
        id: 3,
        title: 'HydraFacial',
        description: 'Combines cleansing, exfoliation, extraction, hydration, and antioxidant protection for instant glow.',
        price: 19.99,
        imageUrl: 'lib/assets/picture/HydraFacial.webp'),
    Procedure(
        id: 31,
        title: 'LED Light Therapy',
        description: 'Uses colored light (blue for acne, red for wrinkles) to stimulate collagen and kill bacteria without downtime.',
        price: 18.59,
        imageUrl: 'lib/assets/picture/LEDLightTherapy.webp'),
    Procedure(
        id: 32,
        title: 'Microdermabrasion',
        description: 'A diamond-tip wand removes dead cells, reducing fine lines, acne scars, and sun damage.',
        price: 22.49,
        imageUrl: 'lib/assets/picture/Microdermabrasion.webp'),
    Procedure(
        id: 33,
        title: 'Chemical Peel',
        description: 'Applies AHA/BHA solutions to peel away dull layers, revealing brighter skin (mild to strong options available).',
        price: 15.99,
        imageUrl: 'lib/assets/picture/ChemicalPeel.webp'),
    Procedure(
        id: 34,
        title: 'Oxygen Facial',
        description: 'Pressurized oxygen delivers vitamins and hyaluronic acid to plump, hydrate, and revive tired skin.',
        price: 10.89,
        imageUrl: 'lib/assets/picture/OxygenFacial.webp'),
  ],
};