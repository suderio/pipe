/*
 * generated by Xtext 2.16.0
 */
package net.technearts.pipe.tests

import com.google.inject.Inject
import net.technearts.pipe.pipe.Model
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.extensions.InjectionExtension
import org.eclipse.xtext.testing.util.ParseHelper
import org.junit.Ignore
import org.junit.jupiter.api.Assertions
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.^extension.ExtendWith

@ExtendWith(InjectionExtension)
@InjectWith(PipeInjectorProvider)
class PipeParsingTest {
	@Inject
	ParseHelper<Model> parseHelper
	
	@Test @Ignore
	def void loadModel() {
		val result = parseHelper.parse('''
		/*
			vetor1: [1, 2, 3]
			mapa1: {a: 1, b: 2, c: 3}
		*/
		var a = 1
		''')
		Assertions.assertNotNull(result)
		val errors = result.eResource.errors
		Assertions.assertTrue(errors.isEmpty, '''Unexpected errors: «errors.join(", ")»''')
	}
}