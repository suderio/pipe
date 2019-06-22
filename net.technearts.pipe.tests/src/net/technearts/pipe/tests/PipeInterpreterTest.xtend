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

	@Test
	def void andTrue() { "true && true".assertInterpret(true) }

	@Test
	def void andFalse() { "true && false".assertInterpret(false) }

	@Test
	def void orTrue() { "true || false".assertInterpret(true) }

	@Test
	def void equality() { "1 == 1".assertInterpret(true) }

	@Test
	def void inequality() { "1 == 0".assertInterpret(false) }

	@Test
	def void add() { "0 + 1".assertInterpret(BigDecimal.ONE) }

	@Test
	def void subtract() { "1 - 1 ".assertInterpret(BigDecimal.ZERO) }

	@Test
	def void multiply() { "1 * 10".assertInterpret(BigDecimal.TEN) }

	@Test
	def void divide() { "10 / 10".assertInterpret(BigDecimal.ONE) }

	@Test
	def void varRef() { "a: 0 + 1\na".assertInterpret(BigDecimal.ONE) }

	@Test
	def void parens() { "1 * (3 + 7)".assertInterpret(BigDecimal.TEN) }
}
