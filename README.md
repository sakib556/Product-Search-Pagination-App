# Inventory App
  A flutter project with Rest Api & Cubit.
  Users Can search their product and get also the details of their project.
## Project view 
<div style="display: flex; margin-bottom: 20px;">
  <img src="https://user-images.githubusercontent.com/71273832/220116788-e05f31c7-9785-4b0a-9f7a-8f072be0cf37.jpg" width="200" height="400" style="margin-right: 10px;">
  <img src="https://user-images.githubusercontent.com/71273832/220117237-0545086a-8253-4c03-bce7-11323f33f0c3.jpg" width="200" height="400" style="margin-right: 10px;">
  <img src="https://user-images.githubusercontent.com/71273832/220117259-922b9df5-9fd2-47b3-bc4c-4bf65c47326a.jpg" width="200" height="400">
</div>
<div style="display: flex; margin-bottom: 20px;">
  <img src="https://user-images.githubusercontent.com/71273832/220117270-2733330f-43df-410d-972b-f638e6a7511f.jpg" width="200" height="400" style="margin-right: 10px;">
  <img src="https://user-images.githubusercontent.com/71273832/220117282-b643936d-ac25-4b1b-ab5b-fa2138789858.jpg" width="200" height="400" style="margin-right: 10px;">
  <img src="https://user-images.githubusercontent.com/71273832/220117297-aab9368f-6e12-476b-a8be-def2f1ffd353.jpg" width="200" height="400">
</div>

### Details : 
    
In this project I integrate 2 rest-api in 2 screens.
- Search screen : On this screen , I have integrated a rest api for pagination , gradually 10 product can view on every hit in the api. A searchbar also added, where you can search the products by the slug name like "rice".
- Details screen : On this screen , I have integrated a rest api which body is taken the slug value of the product and show the details of that product. 
    
I have used Cubit(Bloc) pattern to hanldle the state.(Used 3 state: initial,loading,loaded)
    
    






