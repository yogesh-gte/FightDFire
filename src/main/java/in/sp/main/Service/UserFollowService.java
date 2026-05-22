package in.sp.main.Service;

import java.util.stream.Collectors;
import java.util.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.sp.main.Entities.User;
import in.sp.main.Entities.UserFollow;
import in.sp.main.Repository.UserFollowRepository;
import in.sp.main.Repository.UserRepository;
import jakarta.transaction.Transactional;


@Service
public class UserFollowService {

    @Autowired
    private UserFollowRepository followRepo;

    @Autowired
    private UserRepository userRepo;
    
    private static final Logger log = LoggerFactory.getLogger(UserFollowService.class);

    public void followUser(Long followerId, Long followedId) {
        User follower = userRepo.findById(followerId).orElseThrow();
        User followed = userRepo.findById(followedId).orElseThrow();

        if (!followRepo.existsByFollowerAndFollowed(follower, followed)) {
            UserFollow uf = new UserFollow();
            uf.setFollower(follower);
            uf.setFollowed(followed);
            
            // Always set to false so it generates a follow request that must be accepted
            uf.setAccepted(false);
            
            followRepo.save(uf);
        }
    }

    public boolean isFollowing(Long followerId, Long followingId) {
        return followRepo.existsByFollower_IdAndFollowed_Id(followerId, followingId);
    }

    public boolean isAcceptedFollower(Long followerId, Long followedId) {
        return followRepo.existsByFollower_IdAndFollowed_IdAndAcceptedTrue(followerId, followedId);
    }


    public boolean isFollowing(User follower, User followed) {
        return followRepo.existsByFollowerAndFollowed(follower, followed);
    }

    public boolean isMutualFollow(User a, User b) {
        return isFollowing(a, b) && isFollowing(b, a);
    }

 // ONLY accepted followers
    public List<User> getFollowers(Long userId) {
        return followRepo.findByFollowed_IdAndAcceptedTrue(userId)
                .stream()
                .map(UserFollow::getFollower)
                .collect(Collectors.toList());
    }

    // ONLY accepted following
    public List<User> getFollowing(Long userId) {
        return followRepo.findByFollower_IdAndAcceptedTrue(userId)
                .stream()
                .map(UserFollow::getFollowed)
                .collect(Collectors.toList());
    }

    // Pending requests
    public List<User> getPendingRequests(Long userId) {
        return followRepo.findByFollowed_IdAndAcceptedFalse(userId)
                .stream()
                .map(UserFollow::getFollower)
                .collect(Collectors.toList());
    }

    public boolean isPendingRequest(Long followerId, Long followedId) {
        return followRepo.existsByFollower_IdAndFollowed_IdAndAcceptedFalse(
                followerId, followedId);
    }

    // ✅ Accept follow request
    public void acceptRequest(Long currentUserId, Long followerId) {
        UserFollow request = followRepo.findByFollower_IdAndFollowed_Id(followerId, currentUserId);
        if (request != null) {
            request.setAccepted(true);
            followRepo.save(request);
        }
    }
    

    @Transactional
    public void unfollowUser(Long followerId, Long followedId) {
        log.info("unfollowUser called with followerId={} followedId={}", followerId, followedId);
        followRepo.deleteByFollower_IdAndFollowed_Id(followerId, followedId);
        log.info("deleteByFollower_IdAndFollowed_Id executed for followerId={} followedId={}", followerId, followedId);
    }
    
    // ❌ Decline follow request
    public void declineRequest(Long currentUserId, Long followerId) {
        UserFollow request = followRepo.findByFollower_IdAndFollowed_Id(followerId, currentUserId);
        if (request != null) {
            followRepo.delete(request);
        }
    }
    public int getPendingRequestCount(Long userId) {
        return followRepo.countByFollowed_IdAndAcceptedFalse(userId);
    }
    public List<User> getFriends(Long userId) {
        List<User> followers = getFollowers(userId);
        List<User> following = getFollowing(userId);

        List<User> friends = new ArrayList<>();
        for (User u : followers) {
            if (following.contains(u)) {
                friends.add(u);
            }
        }
        return friends;
    }

}