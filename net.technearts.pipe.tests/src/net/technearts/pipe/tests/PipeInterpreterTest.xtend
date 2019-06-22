package net.technearts.pipe.tests

import com.google.inject.Inject
import interpreter.PipeInterpreter
import java.math.BigDecimal
import net.technearts.pipe.pipe.Model
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.extensions.InjectionExtension
import org.eclipse.xtext.testing.util.ParseHelper
import org.eclipse.xtext.testing.validation.ValidationTestHelper
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.^extension.ExtendWith

import static extension org.junit.jupiter.api.Assertions.assertEquals

@ExtendWith(InjectionExtension)
@InjectWith(PipeInjectorProvider)
class PipeInterpreterTest {
	@Inject extension ParseHelper<Model>
	@Inject extension ValidationTestHelper
	@Inject extension PipeInterpreter

	def assertInterpret(CharSequence input, Object expected) {
		input.parse => [
			assertNoErrors
			expected.assertEquals(elements.last.expression.interpret)
		]
	}

	@Test
	def void numberConstant() { "1".assertInterpret(BigDecimal.ONE) }
	@Test
	def void stringConstant() { "'1xxx1'".assertInterpret("1xxx1") }
	@Test
	def void boolConstant() { "true".assertInterpret(true) }
}
