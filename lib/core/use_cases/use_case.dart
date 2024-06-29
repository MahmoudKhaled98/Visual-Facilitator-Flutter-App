///Business logic "Domain layer" Use cases abstraction
//Params is Parameters 
abstract class UseCase<Type,Params>{
  Future<Type> call({Params? params});
}