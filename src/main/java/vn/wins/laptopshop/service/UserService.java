package vn.wins.laptopshop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import vn.wins.laptopshop.domain.Role;
import vn.wins.laptopshop.domain.User;
import vn.wins.laptopshop.domain.dto.RegisterDTO;
import vn.wins.laptopshop.repository.OrderRepository;
import vn.wins.laptopshop.repository.ProductRepository;
import vn.wins.laptopshop.repository.RoleRepository;
import vn.wins.laptopshop.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final ProductRepository productRepository;
    private final OrderRepository orderRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository,
            ProductRepository productRepository, OrderRepository orderRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.productRepository = productRepository;
        this.orderRepository = orderRepository;
    }

    public Page<User> getAllUsers(Pageable page) {
        return this.userRepository.findAll(page);
    }

    public List<User> getAllUserByEmail(String email) {
        return this.userRepository.findTop1ByEmail(email);
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);

    }

    public User handleSaveUser(User user) {
        User nhan = this.userRepository.save(user);
        System.out.println(nhan);
        return nhan;
    }

    public void deleteAUser(long id) {
        this.userRepository.deleteById(id);

    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    // Here is Mapper from registerDTO to User
    public User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();

        user.setFullName(registerDTO.getFirstName() + "" + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());

        return user;
    }

    public boolean checkEmailExist(String email) {
        return this.userRepository.existsByEmail(email);
    }

    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public long countUsers() {
        return this.userRepository.count();
    }

    public long countProducts() {
        return this.productRepository.count();
    }

    public long countOrders() {
        return this.orderRepository.count();
    }
}
