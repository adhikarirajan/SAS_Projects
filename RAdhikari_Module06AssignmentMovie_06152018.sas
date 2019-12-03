/***************************************************************************************************************
**Author		: Rajan Adhikari
**Assignment	: RAdhikari_Module06AssignmentMovie_06152018
**Date			: June 15 2017
**College		: Rasmussen
**Course		: Data Element
Professor		: Chintan Thakkar
***************************************************************************************************************/
data work.import;
	Infile '/folders/myfolders/DE/movie_metadata.csv' /*reading the dataset*/
			 delimiter = ',' MISSOVER DSD  firstobs=2 ;
               informat color $5. ;
               informat director_name $17. ;
               informat num_critic_for_reviews best32. ;
               informat duration best32. ;
               informat director_facebook_likes best32. ;
               informat actor_3_facebook_likes best32. ;
               informat actor_2_name $20. ;
               informat actor_1_facebook_likes best32. ;
               informat gross best32. ;
               informat genres $57. ;
               informat actor_1_name $18. ;
               informat movie_title $45. ;
               informat num_voted_users best32. ;
               informat cast_total_facebook_likes best32. ;
               informat actor_3_name $20. ;
               informat facenumber_in_poster best32. ;
               informat plot_keywords $95. ;
               informat movie_imdb_link $52. ;
               informat num_user_for_reviews best32. ;
               informat language $7. ;
               informat country $3. ;
               informat content_rating $5. ;
               informat budget best32. ;
               informat title_year best32. ;
               informat actor_2_facebook_likes best32. ;
               informat imdb_score best32. ;
               informat aspect_ratio best32. ;
               informat movie_facebook_likes best32. ;
               
               format color $5. ;
               format director_name $17. ;
               format num_critic_for_reviews best12. ;
               format duration best12. ;
               format director_facebook_likes best12. ;
               format actor_3_facebook_likes best12. ;
               format actor_2_name $20. ;
               format actor_1_facebook_likes best12. ;
               format gross best12. ;
               format genres $57. ;
               format actor_1_name $18. ;
               format movie_title $45. ;
               format num_voted_users best12. ;
               format cast_total_facebook_likes best12. ;
               format actor_3_name $20. ;
               format facenumber_in_poster best12. ;
               format plot_keywords $95. ;
               format movie_imdb_link $52. ;
               format num_user_for_reviews best12. ;
               format language $7. ;
               format country $3. ;
               format content_rating $5. ;
               format budget best12. ;
               format title_year best12. ;
               format actor_2_facebook_likes best12. ;
               format imdb_score best12. ;
               format aspect_ratio best12. ;
               format movie_facebook_likes best12. ;
            
            input
                        color  $
                        director_name  $
                        num_critic_for_reviews
                        duration
                        director_facebook_likes
                        actor_3_facebook_likes
                        actor_2_name  $
                        actor_1_facebook_likes
                        gross
                        genres  $
                        actor_1_name  $
                        movie_title  $
                        num_voted_users
                        cast_total_facebook_likes
                        actor_3_name  $
                        facenumber_in_poster
                        plot_keywords  $
                        movie_imdb_link  $
                        num_user_for_reviews
                        language  $
                        country  $
                        content_rating  $
                        budget
                        title_year
                        actor_2_facebook_likes
                        imdb_score
                        aspect_ratio
                        movie_facebook_likes
            ;
            run;
            
 proc sort 
 data =work.import
 out=top10;
 by movie_facebook_likes;
 run;
 
 /* ranking the top 10 by grouping movie_facebook_likes*/  
proc rank 
data=work.import
out = rank10;
by  movie_facebook_likes;

var movie_facebook_likes;
ranks rank10;
run;
  