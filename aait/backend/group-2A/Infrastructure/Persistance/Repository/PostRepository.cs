using Application.Contracts.Persistance;
using Domain.Entities;

namespace Infrastructure.Persistance.Repository;

public class PostRepository: IPostRepository
{
    
    
    public Task<Post> Add(Post entity){
        
    }

    public Task<Post> Get(int id){
        throw new NotImplementedException();
    }

    public Task<List<Post>> GetAll(){
        throw new NotImplementedException();
    }

    public Task<List<Post>> GetBytag(string tags){
        throw new NotImplementedException();
    }

    public Task<List<Post>> GetFollowingPost(int id){
        throw new NotImplementedException();
    }

    public Task<List<Post>> GetByContenet(string tags){
        throw new NotImplementedException();
    }

    public Task<List<Post>> GetUserPost(int id){
        throw new NotImplementedException();
    }

    public Task Update(Post entity){
        throw new NotImplementedException();
    }


    public Task Delete(Post entity){
        throw new NotImplementedException();
    }
    public Task<bool> Exists(int id){
        throw new NotImplementedException();
    }
}