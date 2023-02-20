# Inventory App
  A flutter project with Rest Api & Cubit.
  Users Can search their product and get also the details of their project.
## Project view 
<div style="display: flex; flex-wrap: wrap; margin-bottom: 20px;">
  <div style="flex: 50%; padding-right: 5px;">
    <img src="https://user-images.githubusercontent.com/71273832/220116788-e05f31c7-9785-4b0a-9f7a-8f072be0cf37.jpg" width="100%">
  </div>
  <div style="flex: 50%; padding-left: 5px;">
    <img src="https://user-images.githubusercontent.com/71273832/220117237-0545086a-8253-4c03-bce7-11323f33f0c3.jpg" width="100%">
  </div>
</div>

<div style="display: flex; flex-wrap: wrap; margin-bottom: 20px;">
  <div style="flex: 50%; padding-right: 5px;">
    <img src="https://user-images.githubusercontent.com/71273832/220117259-922b9df5-9fd2-47b3-bc4c-4bf65c47326a.jpg" width="100%">
  </div>
  <div style="flex: 50%; padding-left: 5px;">
    <img src="https://user-images.githubusercontent.com/71273832/220117270-2733330f-43df-410d-972b-f638e6a7511f.jpg" width="100%">
  </div>
</div>

### Details : 
    
In this project I integrate 2 rest-api in 2 screens.
- Search screen : On this screen , I have integrated a rest api for pagination , gradually 10 product can view on every hit in the api. A searchbar also added, where you can search the products by the slug name like "rice".
- Details screen : On this screen , I have integrated a rest api which body is taken the slug value of the product and show the details of that product. 
    
I have used Cubit(Bloc) pattern to hanldle the state.(Used 3 state: initial,loading,loaded)
    
    






