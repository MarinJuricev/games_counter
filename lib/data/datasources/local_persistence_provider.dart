import 'package:hive/hive.dart';

abstract class LocalPersistenceProvider {
  Future<int> saveIntoPersistence({dynamic valueToSave, String boxToSaveInto});
  Future<int> clearPersistence({String boxToClear});
  Future<dynamic> getFromPersistence({String boxToGetDataFrom});
}

class LocalPersistenceProviderImpl implements LocalPersistenceProvider {
  @override
  Future<int> saveIntoPersistence({
    dynamic valueToSave,
    String boxToSaveInto,
  }) async {
    final box = await Hive.openBox(boxToSaveInto);

    return await box.add(valueToSave);
  }

  @override
  Future getFromPersistence({String boxToGetDataFrom}) async {
    final box = await Hive.openBox(boxToGetDataFrom);

    return await box.get(box.length - 1);
  }

  @override
  Future<int> clearPersistence({String boxToClear}) async {
    final box = await Hive.openBox(boxToClear);
    return box.clear();
  }
}