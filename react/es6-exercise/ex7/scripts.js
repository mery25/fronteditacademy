var tasks = [
   {
      'name' : 'Start React web',
      'duration' : 120
   },
   {
      'name' : 'Work out',
      'duration' : 60
   },
   {
      'name' : 'Procrastinate on facebook',
      'duration' : 240
   }
   ];



   // Usar .forEach() per obtenir aquest array.

   const taskNames1 = []
   tasks.forEach(task => taskNames1.push(task.name))
   console.log(taskNames1)

   // Usar .map() per obtenir aquest array.
   const taskNames2 = tasks.map(task => task.name)
   console.log(taskNames2)
   
