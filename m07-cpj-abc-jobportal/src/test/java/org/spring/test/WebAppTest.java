package org.spring.test;

import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.spring.config.JpaConfig;
import org.spring.config.WebAppInitializer;
import org.spring.model.Message;
import org.spring.model.Profile;
import org.spring.model.Threads;
import org.spring.model.User;
import org.spring.repository.MessageRepository;
import org.spring.repository.ThreadRepository;
import org.spring.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = { JpaConfig.class, WebAppInitializer.class })
public class WebAppTest {

	@Autowired
	UserRepository repo;

	@Autowired
	ThreadRepository threadRepo;

	@Autowired
	MessageRepository msgRepo;

	@Test
	public void loginTest() {

		String email = "nanda@email.com", wrongPass = "1234", pass = "qwerty", role = "user";

		User user = repo.findByEmail(email);

		assertNotNull(user);
		assertEquals(email, user.getEmail());
		assertNotEquals(wrongPass, user.getPassword());
		assertEquals(pass, user.getPassword());
		assertEquals(role, user.getRole());
	}

	@Test
	public void registrationTest() {

		int random = (int) (Math.random() * 100);

		String email = "test" + random + "@email.com", pass = "qwerty";
		String first = "putu", last = "bagus", country = "indo";

		Profile profile = new Profile();
		profile.setFirstName(first);
		profile.setLastName(last);
		profile.setCountry(country);

		User user = new User();
		user.setEmail(email);
		user.setPassword(pass);
		user.setProfile(profile);
		user.setRole("user");

		repo.save(user);

		User u = repo.findById(user.getId()).get();

		assertEquals(email, u.getEmail());
		assertEquals(pass, u.getPassword());

	}

	@Test
	public void addThreadTest() {
		Threads java = new Threads();
		java.setTitle("java news weekly");
		java.setContent("hero.jpg");
		java.setDescription("now java 19 is publish see waht is new");
		java.setPublishDate(new Date());
		java.setPublisher(repo.findByEmail("nanda@email.com"));
		java.setLikeCount(100);

		threadRepo.save(java);

		assertNotNull(threadRepo.findById(java.getId()).get());
	}

	@Test
	public void sendMessageTest() {
		User usr1 = repo.findById(1L).get();
		User usr2 = repo.findById(2L).get();

		Message helo = new Message();
		helo.setFromUser(usr1);
		helo.setToUser(usr2);
		helo.setSendOn(new Date());
		helo.setMessage("whats app bro");

		msgRepo.save(helo);

		assertNotNull(msgRepo.findById(helo.getId()).get());

		Message helo2 = new Message();
		helo2.setFromUser(usr2);
		helo2.setToUser(usr1);
		helo2.setSendOn(new Date());
		helo2.setMessage("hey, im good, hwat about u? ");

		msgRepo.save(helo2);

		assertNotNull(msgRepo.findById(helo2.getId()).get());

	}

	@Test
	public void searchTest() {
		assertNotNull(repo.search("nanda"));
	}

}
