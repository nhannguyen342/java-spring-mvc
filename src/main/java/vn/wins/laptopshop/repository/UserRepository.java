package vn.wins.laptopshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.wins.laptopshop.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User wins);

    void deleteById(long id);

    List<User> findTop1ByEmail(String email);

    Page<User> findAll(Pageable page);

    User findById(long id);

    boolean existsByEmail(String email);

    User findByEmail(String email);
}
